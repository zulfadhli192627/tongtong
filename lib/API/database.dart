import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference tongCollection =
      Firestore.instance.collection('tongtong');

  final String email;
  DatabaseService({this.email});

  //to create and update user doc data
  Future updateUserData(String picUrl) async {
    return await tongCollection.document(email).setData({'picUrl': picUrl});
  }
}
