import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tong_tong/model/user.dart';

class DatabaseService {
  final CollectionReference tongCollection =
      Firestore.instance.collection('tongtong');
  final String email;
  DatabaseService({this.email});

  //to create and update user doc data
  Future updateUserData(String picUrl) async {
    return await tongCollection.document(email).setData({'picUrl': picUrl});
  }

  // create group code
  Future createGroup(
      String groupcode, String imgurl, String tax, String groupid) async {
    return await tongCollection
        .document(email)
        .collection('group')
        .document(groupcode)
        .setData({
      'tax': tax,
      'imgurl': imgurl,
      'groupId': groupid,
    });
  }
}
