import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/conts/deco.dart';
import 'package:tong_tong/conts/textInputDecoration.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/services/database.dart';
import 'package:tong_tong/widget/ItemTile.dart';

class Group extends StatefulWidget {
  final GroupData group;
  Group({Key key, this.group}) : super(key: key);

  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  String name, itemName, price, quantity;

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
                          decoration:
                              textInputDecoration.copyWith(labelText: 'Name'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter Loaner Name' : null,
                          onChanged: (val) => setState(() => name = val),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                      SizedBox(
                        height: 20,
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
                                  "name": name,
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
            return Dialog(
              child: Container(
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: new NetworkImage(url),
                )),
              ),
            );
          });
    }

    // Future<void> totalDialog(BuildContext context, double total) {
    //   return showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: Text('Total Amount'),
    //           content: Container(
    //             child: Text('The total price is RM' + total.toString()),
    //           ),
    //         );
    //       });
    // }

    return StreamBuilder<UserData>(
        stream: DatabaseService(email: user.email).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.blue,
              title: Text(widget.group.groupname),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 20, 10),
                  decoration: BoxDecoration(
                    border: Border.symmetric(),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      imageDialog(context, widget.group.imgurl);
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
                // ListView(
                //   children: <Widget>[
                //     SizedBox(
                //       height: 100,
                //       child: ListView.builder(
                //           scrollDirection: Axis.horizontal,
                //           itemCount: 1,
                //           itemBuilder: (context, index) {
                //             return Row(
                //               children: [
                //                 CircleAvatar(
                //                   backgroundImage:
                //                       NetworkImage(userData.picUrl),
                //                   child: Text('Name'),
                //                 )
                //               ],
                //             );
                //           }),
                //     )
                //   ],
                // ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(userData.picUrl),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(userData.name)
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Container(
                    decoration: tileDecoration(),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 130,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Item Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 90,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            'Quantity',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 90,
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Price',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 21.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                  ],
                )
              ],
            ),
            bottomNavigationBar: Container(
              height: 50.0,
              color: Colors.white,
            ),
          );
        });
  }
}
