import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/screen/addBill.dart';
import 'package:tong_tong/services/database.dart';
import 'package:tong_tong/widget/2optionButton.dart';
import 'package:tong_tong/widget/bill_list.dart';

class BillHome extends StatelessWidget {
  const BillHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: true);
    return StreamProvider<List<GroupData>>.value(
      value: DatabaseService(email: user.email).groupData,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Bill Split'),
        ),
        body: Container(
          decoration: BoxDecoration(),
          child: BillList(),
        ),
        floatingActionButton: TwoOptionButton(),
      ),
    );
  }
}
