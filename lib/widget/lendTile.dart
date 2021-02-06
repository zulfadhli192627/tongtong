import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/conts/deco.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/screen/lent.dart';
import 'package:tong_tong/dump/loan.dart';

class LoanTile extends StatelessWidget {
  final GroupData group;
  LoanTile({this.group});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: true);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LentDetail(
                group: group,
                email: user.email,
              ),
            ));
      },
      child: Container(
        decoration: tileDecoration(),
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                group.groupname,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text(
                group.tax,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
