import 'package:bank/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:bank/screens/profilepage/profile_page.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _auth = AuthServices() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Emergency"),
        backgroundColor: Color(0xFFF44336),
        onPressed: () {},
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
               Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()  ));
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
        // TODO Home Page
        /*child: RaisedButton(
              color: Colors.black,
              child: Text("Logout"),
              onPressed: () async {
               await _auth.signOut();
              },
            ),*/
      ),
    );
  }
}
