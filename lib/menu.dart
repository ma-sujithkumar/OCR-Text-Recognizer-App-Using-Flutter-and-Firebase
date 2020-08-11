import 'package:flutter/material.dart';
import 'package:text_rec/id.dart';
import 'package:text_rec/video.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.png'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('OCR Text Recognizer'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ID()))
            },
          ),
          ListTile(
              leading: Icon(Icons.ondemand_video),
              title: Text("How to use it?"),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VideoApp()))
                  })
        ],
      ),
    );
  }
}
