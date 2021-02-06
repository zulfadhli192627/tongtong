import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/services/createGroup.dart';
import 'package:tong_tong/services/database.dart';

class Upload extends StatefulWidget {
  final File file;
  String groupName;
  String tax;
  String groupID;
  Upload({Key key, this.file, this.groupName, this.tax, this.groupID})
      : super(key: key);

  @override
  createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://tongtong-45ede.appspot.com');
  String fileName;

  StorageUploadTask _uploadTask;

  void _startUpload() async {
    fileName = widget.groupName + DateTime.now().toString();

    setState(() {
      _uploadTask =
          _storage.ref().child('images/' + fileName).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: true);
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
                  CreateGroup(
                    groupName: widget.groupName,
                    groupid: widget.groupID,
                    email: user.email,
                    tax: widget.tax,
                    fileName: fileName,
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
