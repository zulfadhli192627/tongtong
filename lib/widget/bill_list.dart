import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/services/database.dart';
import 'package:tong_tong/widget/bill_tile.dart';

class BillList extends StatefulWidget {
  String email;
  BillList({this.email});
  @override
  _BillListState createState() => _BillListState();
}

class _BillListState extends State<BillList> {
  @override
  Widget build(BuildContext context) {
    final group = Provider.of<List<GroupData>>(context, listen: true);
    return ListView.builder(
      itemCount: group.length,
      itemBuilder: (context, index) {
        return BillTile(
          group: group[index],
        );
      },
    );
  }
}
