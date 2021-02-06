import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tong_tong/screen/homescreen.dart';

class CreateProfile extends StatelessWidget {
  final String name, filename;
  final String email;
  CreateProfile({this.name, this.filename, this.email});

  final CollectionReference tongCollection =
      Firestore.instance.collection('tongtong');

  void _createGroup() async {
    dynamic url = await FirebaseStorage.instance
        .ref()
        .child('user')
        .child(filename)
        .getDownloadURL();

    return await tongCollection
        .document(email)
        .setData({'name': name, 'picUrl': url});
  }

  @override
  Widget build(BuildContext context) {
    _createGroup();
    return RaisedButton(
      child: Text('Proceed'),
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      },
    );
  }
}
