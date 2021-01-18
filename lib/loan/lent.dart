import 'package:flutter/material.dart';

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
    );
  }
}
