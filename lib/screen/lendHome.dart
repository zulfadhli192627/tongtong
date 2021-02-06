import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/services/database.dart';
import 'package:tong_tong/widget/lendList.dart';
import 'package:tong_tong/widget/lendTile.dart';

class LoanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: true);
    return StreamProvider<List<GroupData>>.value(
      value: DatabaseService(email: user.email).groupData,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Hutang'),
        ),
        body: ListView(
          children: <Widget>[
            //Lent Section--------------------------------------------------------
            Container(
              color: Colors.black,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      'Lent',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      'RM00.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            LendList(),
            //end of lent---------------------------------------------------------
          ],
        ),
      ),
    );
  }
}
