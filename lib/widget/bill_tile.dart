import 'package:flutter/material.dart';
import 'package:tong_tong/screen/groupPage.dart';

class BillTile extends StatelessWidget {
  //final Bill bill;
  //BillTile({this.bill});

  const BillTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.only(top: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.pink,
              //backgroundImage: ,
            ),
            title: Text("Group Name"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Group()),
              );
            },
          )),
    );
  }
}
