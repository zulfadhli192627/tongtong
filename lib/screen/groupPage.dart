import 'package:flutter/material.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/widget/bill_item.dart';
import 'package:tong_tong/widget/bill_tile.dart';

class Group extends StatefulWidget {
  final GroupData group;
  Group({Key key, this.group}) : super(key: key);

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
        title: Text(widget.group.groupname),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Text('View Receipt'),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                "Group Code:" + widget.group.id,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.person,
                size: 75,
              ),
              Icon(
                Icons.person,
                size: 75,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return BillItem();
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(right: 45),
              child: Text(
                'Tax: ' + widget.group.tax + '%',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(child: Text('Add Item'), onPressed: () {}),
              SizedBox(
                width: 30,
              ),
              RaisedButton(child: Text('Calculate Total'), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
