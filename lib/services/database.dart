import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/screen/groupPage.dart';

class DatabaseService {
  final CollectionReference tongCollection =
      Firestore.instance.collection('tongtong');
  final String email;

  DatabaseService({this.email});

  List<GroupData> _groupdatafromsnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      List<Item> items = [];
      List<dynamic> itemMap = doc.data['Item'] ?? null;
      if (itemMap != null) {
        itemMap.forEach((element) {
          items.add(new Item(
              itemName: element['itemName'] ?? '',
              name: element['name'] ?? '',
              price: element['price'] ?? '',
              quantity: element['quantity'] ?? ''));
        });
      }
      return GroupData(
          id: doc.data['groupid'] ?? '',
          groupname: doc.data['groupName'] ?? '',
          imgurl: doc.data['imgurl'] ?? '',
          tax: doc.data['tax'] ?? '',
          item: items ?? '');
    }).toList();
  }

  UserData _userdatafromsnapshot(DocumentSnapshot snapshot) {
    return UserData(
        name: snapshot.data['name'], picUrl: snapshot.data['picUrl']);
  }

  //to create and update user doc data
  Future updateUserData(String picUrl) async {
    return await tongCollection.document(email).setData({'picUrl': picUrl});
  }

  // Method for user profile
  StorageUploadTask _uploadTask;
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://tongtong-45ede.appspot.com');

  Future updateUserProfile(File file, String name) async {
    String fileName = name + DateTime.now().toString();

    _uploadTask = _storage.ref().child('user/' + fileName).putFile(file);

    dynamic url = await FirebaseStorage.instance
        .ref()
        .child('user')
        .child(fileName)
        .getDownloadURL();

    if (_uploadTask.isComplete) {
      await tongCollection
          .document(email)
          .setData({'name': name, 'picUrl': url});
    }
  }

  Stream<List<GroupData>> get groupData {
    return tongCollection
        .document(email)
        .collection('group')
        .snapshots()
        .map((_groupdatafromsnapshot));
  }

  Stream<UserData> get userData {
    return tongCollection
        .document(email)
        .snapshots()
        .map((_userdatafromsnapshot));
  }
}
