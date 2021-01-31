import 'package:flutter/material.dart';
import 'package:tong_tong/screen/bill_list.dart';

import 'loanHome.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoanPage()),
          );
        },
        label: Text('New Bill'),
        icon: Icon(Icons.receipt_rounded),
      ),
    );
  }
}
