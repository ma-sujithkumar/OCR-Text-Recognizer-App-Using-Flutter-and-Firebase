import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ID extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Developer Info'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [Colors.green, Colors.blue]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 85.0,
              child: CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/images/mypic.jpg'),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Sujithkumar M A',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 4.0,
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'STUDENT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 40.0,
              width: 105.0,
              child: Divider(
                color: Colors.white,
                thickness: 2.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 5),
              child: FlatButton(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.email,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'masujithkumar@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: 'masujithkumar@gmail.com'));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: FlatButton(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.phone_in_talk,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '+91 XXXXXXXXX',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: '6382458470'));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: FlatButton(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    FaIcon(FontAwesomeIcons.instagram),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '@mask.apk',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: '@mask.apk'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
