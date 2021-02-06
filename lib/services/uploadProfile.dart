import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tong_tong/services/createProfile.dart';

class UploadProfile extends StatefulWidget {
  final File file;
  final String name, email;
  UploadProfile({Key key, this.file, this.name, this.email}) : super(key: key);

  @override
  createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://tongtong-45ede.appspot.com');
  String fileName;

  StorageUploadTask _uploadTask;

  void _startUpload() async {
    fileName = widget.name + DateTime.now().toString();

    setState(() {
      _uploadTask =
          _storage.ref().child('user/' + fileName).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
          stream: _uploadTask.events,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progressPercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;
            return Column(
              children: [
                if (_uploadTask.isComplete)
                  CreateProfile(
                    name: widget.name,
                    filename: fileName,
                    email: widget.email,
                  ),
                if (_uploadTask.isPaused)
                  FlatButton(
                    child: Icon(Icons.play_arrow),
                    onPressed: _uploadTask.resume,
                  ),
                if (_uploadTask.isInProgress)
                  FlatButton(
                    onPressed: _uploadTask.pause,
                    child: Icon(Icons.pause),
                  ),
                LinearProgressIndicator(
                  value: progressPercent,
                ),
                Text('${(progressPercent * 100).toStringAsFixed(2)} % '),
              ],
            );
          });
    } else {
      return FlatButton.icon(
        label: Text('Upload'),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}
