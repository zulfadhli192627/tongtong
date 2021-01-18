import 'package:flutter/material.dart';

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
    );
  }
}
