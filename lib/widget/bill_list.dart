import 'package:flutter/material.dart';
import 'package:tong_tong/widget/bill_tile.dart';

class BillList extends StatefulWidget {
  @override
  _BillListState createState() => _BillListState();
}

class _BillListState extends State<BillList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) {
        return BillTile();
      },
    );
  }
}
