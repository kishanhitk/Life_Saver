import 'dart:async';

import 'package:bank/model/user.dart';
import 'package:bank/screens/Auth/register_page.dart';
import 'package:bank/screens/notificationpage/notificationPage.dart';
import 'package:bank/screens/requestPage/requestPage.dart';
import 'package:bank/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:bank/screens/profilepage/profile_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
// Firestore _firestore = Firestore();
String name = '';

class HomePage extends StatefulWidget {
  final String uid;

  HomePage({this.uid});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  void initState() {
    super.initState();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //print("MESSAGE"+message['notification']['title']);
        Timer(Duration(seconds: 2),
            () => print("MESSAGE" + message['notification']['title']));
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title'] ?? "n"),
              subtitle: Text(message['notification']['body'] ?? "n"),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("OK"))
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Transform.scale(
        scale: 1,
        child: FloatingActionButton.extended(
          heroTag: "FAB",
          label: Text("Emergency"),
          backgroundColor: Color(0xFFF44336),
          onPressed: () {
            Navigator.of(context).push(
              new PageRouteBuilder(
                fullscreenDialog: false,
                opaque: false,
                barrierDismissible: true,
                pageBuilder: (BuildContext context, _, __) {
                  return Hero(tag: "FAB", child: RequestPage());
                },
              ),
            );
          },
          icon: Center(
              child: Icon(
            Icons.warning,
            size: 34,
          )),
        ),
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()));
            },
          ),
        ],
        centerTitle: true,
        title: Text('Welcome to LifeSaver'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF2D78FF),
              ),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              title: Text(
                'About Us',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            widget.uid ?? " ",
          ),
        ),
      ),
    );
  }
}
