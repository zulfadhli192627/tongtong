import 'package:flutter/material.dart';
import 'package:tong_tong/widget/bill_list.dart';

class Group extends StatefulWidget {
  Group({Key key}) : super(key: key);

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Group Name here'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Group Code",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Column(
            children: <Widget>[
              Icon(Icons.person_add),
              Icon(Icons.person),
              Icon(Icons.person),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BillList(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
