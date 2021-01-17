import 'package:flutter/material.dart';
import 'package:tong_tong/conts/deco.dart';

class LoanTile extends StatelessWidget {
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
              'McD',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(
              'RM30.00',
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
