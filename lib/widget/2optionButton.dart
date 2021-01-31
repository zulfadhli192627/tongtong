import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:tong_tong/conts/inputFormatter.dart';
import 'package:tong_tong/conts/textInputDecoration.dart';
import 'package:tong_tong/screen/addBill.dart';

class TwoOptionButton extends StatefulWidget {
  const TwoOptionButton({Key key}) : super(key: key);

  @override
  _TwoOptionButtonState createState() => _TwoOptionButtonState();
}

class _TwoOptionButtonState extends State<TwoOptionButton> {
  String _groupCode;

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Center(child: Text('Enter Group Code')),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                UpperCaseTextFormatter(),
                              ],
                              maxLength: 6,
                              decoration: textInputDecoration.copyWith(
                                hintText: 'Insert Code Here',
                                counterText: "",
                              ),
                              validator: (val) =>
                                  val.isEmpty ? 'Enter Group Name' : null,
                              onChanged: (val) =>
                                  setState(() => _groupCode = val),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Image.asset('images/right_arrow.png'),
                              iconSize: 50,
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.add_event,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: Color(0xFF801E48),
      visible: true,
      curve: Curves.bounceIn,
      children: [
        // FAB 1
        SpeedDialChild(
            child: Icon(Icons.receipt_rounded),
            backgroundColor: Color(0xFF801E48),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBill()),
              );
            },
            label: 'Add New Bill',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFF801E48)),
        // FAB 2
        SpeedDialChild(
            child: Icon(Icons.group_add),
            backgroundColor: Color(0xFF801E48),
            onTap: () {
              _showChoiceDialog(context);
            },
            label: 'Join Group',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: Color(0xFF801E48))
      ],
    );
  }
}
