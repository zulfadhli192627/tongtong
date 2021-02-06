import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/screen/groupPage.dart';

class BillTile extends StatelessWidget {
  //final Bill bill;
  //BillTile({this.bill});
  final GroupData group;
  const BillTile({Key key, this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.only(top: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(group.imgurl),
            ),
            title: Text(group.groupname),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Group(group: group)),
              );
            },
          )),
    );
  }
}
