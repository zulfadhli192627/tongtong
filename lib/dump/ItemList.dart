import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/model/user.dart';

class ItemList extends StatefulWidget {
  ItemList({Key key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<List<GroupData>>(context, listen: true);
    return ListView.builder(
      itemCount: item.length,
      itemBuilder: (context, index) {
        //return BillItem(item: item[index]);
      },
    );
  }
}
