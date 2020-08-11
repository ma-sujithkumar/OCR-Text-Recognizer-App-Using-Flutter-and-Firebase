import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:text_rec/textscreen.dart';
import 'package:text_rec/menu.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  File ImagePicked;
  String text = "";

  void getImage() async {
    var awaitedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      ImagePicked = awaitedImage;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success!"),
            content: Text("Image Parsed Successfully!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  Future<void> setText(BuildContext context) async {
    text = "";
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(ImagePicked);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);
    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          setState(() {
            text = text + word.text + ' ';
          });
        }
        text = text + '\n';
      }
    }
    textRecognizer.close();
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => TextScreen(text1: text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Text("Text Recognizer"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [Colors.green, Colors.blue])),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  elevation: 5.0,
                  child: Center(
                    child: ListTile(
                      leading: Icon(Icons.image),
                      title: Text("Pick Image",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  )),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setText(context);
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  elevation: 5.0,
                  child: Center(
                    child: ListTile(
                      leading: Icon(Icons.text_format),
                      title: Text("Generate Text",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
