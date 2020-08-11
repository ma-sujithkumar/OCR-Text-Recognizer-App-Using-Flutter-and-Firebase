import 'package:flutter/material.dart';
import 'package:text_rec/scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scanner(),
        title: "OCR TEXT RECOGNIZER",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue));
  }
}
