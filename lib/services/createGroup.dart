import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreateGroup extends StatelessWidget {
  String groupName, tax, groupid, fileName;
  String email;
  CreateGroup(
      {this.groupName, this.groupid, this.fileName, this.tax, this.email});

  final CollectionReference tongCollection =
      Firestore.instance.collection('tongtong');

  void _createGroup() async {
    dynamic url = await FirebaseStorage.instance
        .ref()
        .child('images')
        .child(fileName)
        .getDownloadURL();

    return await tongCollection
        .document(email)
        .collection('group')
        .document(groupid)
        .setData({
      'tax': tax,
      'imgurl': url,
      'groupName': groupName,
    });
  }

  @override
  Widget build(BuildContext context) {
    _createGroup();
    return Text('Success');
  }
}
