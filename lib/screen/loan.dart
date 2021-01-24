import 'package:flutter/material.dart';
import 'package:tong_tong/widget/loanList.dart';

class LoanDetail extends StatefulWidget {
  @override
  _LoanDetailState createState() => _LoanDetailState();
}

class _LoanDetailState extends State<LoanDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Loan'),
      ),
      bottomNavigationBar: InkWell(
        child: FlatButton.icon(
          height: 50.0,
          color: Colors.blue,
          textColor: Colors.white,
          icon: Icon(Icons.camera),
          label: Text('Camera'),
          onPressed: () {},
        ),
      ),
      body: ListView(children: <Widget>[
        // Loan List Title ----------------------------------------------------
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
              return LoanList();
            },
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          'Scan QR code from group master to delete the loan list',
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
