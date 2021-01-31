import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:tong_tong/conts/textInputDecoration.dart';

class AddBill extends StatefulWidget {
  AddBill({Key key}) : super(key: key);

  @override
  _AddBillState createState() => _AddBillState();
}

class _AddBillState extends State<AddBill> {
  File imageFile;
  final picker = ImagePicker();
  String _groupName;
  String _tax;

  Future _chooseSource(ImageSource source) async {
    final selected = await picker.getImage(source: source);
    setState(() {
      if (selected != null) {
        imageFile = File(selected.path);
      } else {
        imageFile = null;
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Source'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _chooseSource(ImageSource.gallery);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _chooseSource(ImageSource.camera);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  void _clear() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Bill"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 200,
                    child: imageFile != null
                        ? Container(
                            height: 200,
                            child: Image.file(
                              imageFile,
                              width: 200,
                              height: 200,
                            ),
                          )
                        : Text('No Image Selected'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          _showChoiceDialog(context);
                        },
                        child: Text('Select Image'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _clear();
                        },
                        child: Text('Clear Image'),
                      ),
                    ],
                  ),
                  imageFile != null
                      ? Form(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        labelText: 'Group Name'),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter Group Name' : null,
                                    onChanged: (val) =>
                                        setState(() => _groupName = val),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 50,
                                  child: TextFormField(
                                    decoration: textInputDecoration.copyWith(
                                        labelText: 'Tax'),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter Tax' : null,
                                    onChanged: (val) =>
                                        setState(() => _tax = val),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                FlatButton.icon(
                                  label: Text('Upload'),
                                  icon: Icon(Icons.cloud_upload),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddBill()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
