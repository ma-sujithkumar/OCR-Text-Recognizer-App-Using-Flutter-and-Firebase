import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

class TextScreen extends StatelessWidget {
  final String text1;
  TextScreen({Key key, @required this.text1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanned Text"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 1],
                colors: [Colors.green, Colors.blue])),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SelectableText(
              text1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lime,
          child: Icon(Icons.share),
          onPressed: () {
            FlutterShareMe().shareToWhatsApp(msg: text1);
          }),
    );
  }
}
