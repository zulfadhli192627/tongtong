import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tong_tong/dump/lentList.dart';

class LentDetail extends StatefulWidget {
  @override
  _LentDetailState createState() => _LentDetailState();
}

class _LentDetailState extends State<LentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Lent'),
      ),
      body: ListView(children: <Widget>[
        // Lent List Title ----------------------------------------------------
        Container(
          color: Colors.black,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'McDonald',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Text(
                  'RM00.00',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        // Participant List ---------------------------------------------------
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            color: Colors.blue,
            height: 40.0,
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Center(
              child: Text(
                'Participant',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return LentList();
            },
          ),
        ),
        SizedBox(height: 10.0),
        //Settle Button UI ---------------------------------------------------
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.blue,
              onPressed: () {},
              child: Text(
                'Settle',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Let the loaner scan QR code as paid confirmation or Click Settle button to delete bill group',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.0,
        ),
        Align(
          alignment: Alignment.center,
          child: QrImage(
            data: 'https://pub.dev/packages/qr_flutter',
            version: QrVersions.auto,
            size: 200.0,
          ),
        )
      ]),
    );
  }
}
