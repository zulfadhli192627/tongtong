import 'package:flutter/material.dart';

import 'bill_item.dart';

class ItemList extends StatefulWidget {
  ItemList({Key key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return BillItem();
      },
    );
  }
}
