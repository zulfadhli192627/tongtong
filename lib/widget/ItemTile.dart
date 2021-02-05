import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/conts/deco.dart';
import 'package:tong_tong/model/user.dart';

class BillItem extends StatelessWidget {
  //ehe
  final GroupData item;
  final int index;
  const BillItem({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(item.item.toString());
    return Container(
      decoration: tileDecoration(),
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Item Name -----------------------------------------------------------
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              item.item[index].itemName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // Name -----------------------------------------------------------
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              item.item[index].name,
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
              item.item[index].quantity,
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
              item.item[index].price,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
