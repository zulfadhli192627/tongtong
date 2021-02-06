import 'package:flutter/material.dart';
import 'package:tong_tong/conts/deco.dart';
import 'package:tong_tong/model/user.dart';

class BillItem extends StatefulWidget {
  //ehe
  final GroupData item;
  final int index;
  const BillItem({Key key, this.item, this.index}) : super(key: key);

  @override
  _BillItemState createState() => _BillItemState();
}

class _BillItemState extends State<BillItem> {
  List<ListItem<String>> list;

  Future<void> totalDialog(BuildContext context, double total) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Total Amount'),
            content: Container(
              child: Text('The total price is RM' + total.toStringAsFixed(2)),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        double total = 0;
        total = (double.parse(widget.item.item[widget.index].price) *
                double.parse(widget.item.item[widget.index].quantity)) *
            ((100 + int.parse(widget.item.tax)) / 100);
        totalDialog(context, total);
      },
      child: Container(
        decoration: tileDecoration().copyWith(
          color: list[widget.index].isSelected ? Colors.green : Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Item Name -----------------------------------------------------------
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                widget.item.item[widget.index].itemName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Quantity-----------------------------------------------------------
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                widget.item.item[widget.index].quantity,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Price -----------------------------------------------------------
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text(
                'RM' + widget.item.item[widget.index].price,
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

class ListItem<GroupData> {
  bool isSelected = false;
  GroupData data;
  ListItem(this.data);
}
