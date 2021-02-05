import 'package:cloud_firestore/cloud_firestore.dart';
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
      List<dynamic> itemMap = doc.data['Item'];
      itemMap.forEach((element) {
        items.add(new Item(
            itemName: element['itemName'],
            name: element['name'],
            price: element['price'],
            quantity: element['quantity']));
      });
      return GroupData(
          id: doc.data['groupid'] ?? '',
          groupname: doc.data['groupName'] ?? '',
          imgurl: doc.data['imgurl'] ?? '',
          tax: doc.data['tax'] ?? '',
          item: items);
    }).toList();
  }

  //to create and update user doc data
  Future updateUserData(String picUrl) async {
    return await tongCollection.document(email).setData({'picUrl': picUrl});
  }

  Stream<List<GroupData>> get groupData {
    return tongCollection
        .document(email)
        .collection('group')
        .snapshots()
        .map((_groupdatafromsnapshot));
  }
}
