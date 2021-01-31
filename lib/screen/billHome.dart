import 'package:flutter/material.dart';
import 'package:tong_tong/screen/addBill.dart';
import 'package:tong_tong/widget/2optionButton.dart';
import 'package:tong_tong/widget/bill_list.dart';

class BillHome extends StatelessWidget {
  const BillHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
