import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/conts/textInputDecoration.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/widget/ItemTile.dart';

class Group extends StatefulWidget {
  final GroupData group;
  Group({Key key, this.group}) : super(key: key);

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  String itemName, price, quantity;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: true);
    Future<void> _showChoiceDialog(BuildContext context) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Add Item'),
              content: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Item Name'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter Item Name' : null,
                          onChanged: (val) => setState(() => itemName = val),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Item Price'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter Item Price' : null,
                          onChanged: (val) => setState(() => price = val),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Quantity'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter Quantiity' : null,
                          onChanged: (val) => setState(() => quantity = val),
                        ),
                      ),
                      RaisedButton(
                          child: Text("Update"),
                          onPressed: () async {
                            final CollectionReference tongCollection =
                                Firestore.instance.collection('tongtong');

                            await tongCollection
                                .document(user.email)
                                .collection('group')
                                .document(widget.group.id)
                                .updateData({
                              "Item": FieldValue.arrayUnion([
                                {
                                  "name": 'Ali',
                                  "itemName": itemName,
                                  "price": price,
                                  "quantity": quantity,
                                },
                              ])
                            });
                            Navigator.pop(context);
                            setState(() {});
                          })
                    ],
                  ),
                ),
              ),
            );
          });
    }

    Future<void> imageDialog(BuildContext context, String url) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                height: 500,
                width: 300,
                child: Image.network(url),
              ),
            );
          });
    }

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
              onTap: () async {
                dynamic url = await FirebaseStorage.instance
                    .ref()
                    .child('images')
                    .child(widget.group.imgurl)
                    .getDownloadURL();

                imageDialog(context, url);
              },
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
                itemCount: widget.group.item.length,
                itemBuilder: (context, index) {
                  return BillItem(
                    item: widget.group,
                    index: index,
                  );
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
              RaisedButton(
                  child: Text('Add Item'),
                  onPressed: () {
                    _showChoiceDialog(context);
                  }),
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
