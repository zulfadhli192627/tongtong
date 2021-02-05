import 'package:flutter/material.dart';
import 'package:tong_tong/conts/deco.dart';

class BillItem extends StatelessWidget {
  //final Bill bill;
  //BillTile({this.bill});

  const BillItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: tileDecoration(),
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              'Item Name',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(
              'Price',
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
