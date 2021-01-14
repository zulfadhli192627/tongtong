import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class FirebaseMLApi {
  static Future<String> recognizeText(File imageFile) async {
    if (imageFile == null) {
      return 'No Selected Image';
    } else {
      final visionImage = FirebaseVisionImage.fromFile(imageFile);
      final textRecognizer = FirebaseVision.instance.textRecognizer();

      try {
        final visionText = await textRecognizer.processImage(visionImage);
        await textRecognizer.close();

        final text = extractText(visionText);
        return text.isEmpty ? 'No text found in the image' : text;
      } catch (error) {
        return error.toString();
      }
    }
  }

  static extractText(VisionText visionText) {
    String text = '';

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          text = text + word.text + '';
        }
        text = text + '\n';
      }
    }
    return text;
  }
}
