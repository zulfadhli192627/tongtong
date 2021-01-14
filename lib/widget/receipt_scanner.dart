import 'dart:io';

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tong_tong/API/firebase_ml_api.dart';

import 'controls_widget.dart';
import 'text_area_widget.dart';

class ReceiptScanner extends StatefulWidget {
  ReceiptScanner({Key key}) : super(key: key);

  @override
  _ReceiptScannerState createState() => _ReceiptScannerState();
}

class _ReceiptScannerState extends State<ReceiptScanner> {
  String text = '';
  File image;
  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: [
            Expanded(child: buildImage()),
            const SizedBox(height: 16),
            ControlsWidget(
              onClickedPickImage: pickImage,
              onClickedScanText: scanText,
              onClickedClear: clear,
            ),
            const SizedBox(height: 16),
            TextAreaWidget(
              text: text,
              onClickedCopy: copyToClipboard,
            ),
          ],
        ),
      );

  Widget buildImage() => Container(
        child: image != null
            ? Image.file(image)
            : Icon(Icons.photo, size: 80, color: Colors.black),
      );

  Future pickImage() async {
    final file = await ImagePicker().getImage(source: ImageSource.gallery);
    setImage(File(file.path));
  }

  Future scanText() async {
    showDialog(
      context: context,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );

    final text = await FirebaseMLApi.recognizeText(image);
    setText(text);

    Navigator.of(context).pop();
  }

  void clear() {
    setImage(null);
    setText('');
  }

  void copyToClipboard() {
    if (text.trim() != '') {
      FlutterClipboard.copy(text);
    }
  }

  void setImage(File newImage) {
    setState(() {
      image = newImage;
    });
  }

  void setText(String newText) {
    setState(() {
      text = newText;
    });
  }
}
