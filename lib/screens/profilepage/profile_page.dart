import 'package:bank/Services/auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Text('Sign out', style: TextStyle(color: Colors.white),),
            onPressed: () async{
              Navigator.pop(context) ;
              _auth.signOut() ;
            },
          )
        ],
        centerTitle: true,
        title: Text("My Profile"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Color(0x662D78FF),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "Kishan Sharma",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Jadavpur University",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
