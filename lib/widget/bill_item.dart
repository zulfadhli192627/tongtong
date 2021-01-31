import 'package:flutter/material.dart';

class BillItem extends StatelessWidget {
  //final Bill bill;
  //BillTile({this.bill});

  const BillItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.only(top: 8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.pink,
              //backgroundImage: ,
            ),
            title: Text("Item Name"),
          ),
        ),
      ),
      IconButton(icon: Icon(Icons.add), onPressed: () {})
    ]);
  }
}
