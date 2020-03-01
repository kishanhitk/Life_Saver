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
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
               
                  child: Image.network(
                    "https://c4.wallpaperflare.com/wallpaper/410/867/750/vector-forest-sunset-forest-sunset-forest-wallpaper-thumb.jpg",
                    scale: 1,
                    fit: BoxFit.fill,
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
                Positioned(
                  top: 80,
                  left: 130,
                  right: 130,
                  child: Align(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          "https://scontent-bom1-1.xx.fbcdn.net/v/t1.0-9/s960x960/45403612_1016987948505521_8622775694356643840_o.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=a0Gy2k0WLJQAX-UwUcT&_nc_ht=scontent-bom1-1.xx&_nc_tp=7&oh=8509ef4671fe151791e72555ebd6ebb0&oe=5F02A6B1"),
                      backgroundColor: Color(0x662D78FF),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              "Kishan Sharma",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: Text(
            //     "Jadavpur University",
            //     style: TextStyle(color: Colors.grey, fontSize: 14),
            //   ),
            // ),
            Text(
              "B+",
              style: TextStyle(color: Colors.red, fontSize: 25,
              fontWeight: FontWeight.w900),
            ),
            Card(
              
            )
          ],
        ),
      ),
    );
  }
}
