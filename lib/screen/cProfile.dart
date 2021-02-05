import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tong_tong/conts/textInputDecoration.dart';

class CreateProfile extends StatefulWidget {
  CreateProfile({Key key}) : super(key: key);

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final picker = ImagePicker();
  File imageFile;
  String name;

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

  textField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          letterSpacing: 2,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        fillColor: Colors.white30,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff555555),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: <Widget>[
            Text(
              "Profile",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10),
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/no_image.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.white,
                      ),
                      child: IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                          onPressed: () {
                            _showChoiceDialog(context);
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: TextFormField(
                        decoration:
                            textInputDecoration.copyWith(labelText: 'Name'),
                        validator: (val) =>
                            val.isEmpty ? 'Please Enter Your Name' : null,
                        onChanged: (val) => setState(() => name = val),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      child: Text('Confirm'),
                      onPressed: () async {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
