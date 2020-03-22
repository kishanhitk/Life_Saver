import 'package:flutter/material.dart';
import 'package:bank/screens/profilepage/profile_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class HomePage extends StatefulWidget {
  final String uid;

  HomePage({this.uid});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Emergency"),
        backgroundColor: Color(0xFFF44336),
        onPressed: () {
          _firebaseMessaging.getToken().then(
                (value) => print("value is $value this"),
              );
        },
        icon: Center(
            child: Icon(
          Icons.warning,
          size: 34,
        )),
      ),
      appBar: AppBar(
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
                    MaterialPageRoute(builder: (context) => ProfilePage(uid: widget.uid)));
              },
            ),
            ListTile(
              title: Text(
                'Notifications',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            FlatButton(
              child: Container(
                width: 700,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Center(child: Text('Previos Donations', style: TextStyle(color: Colors.white, fontSize: 32),)),
              ),
              onPressed: (){},
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              child: Container(
                width: 700,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Center(child: Text('Rewards', style: TextStyle(color: Colors.white, fontSize: 32),)),
              ),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}
