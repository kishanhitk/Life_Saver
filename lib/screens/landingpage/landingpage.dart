// import 'package:bank/screens/donorlogin/donorloginpage.dart';
import 'package:bank/screens/Auth/auth_landing.dart';
import 'package:bank/screens/Auth/login_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SignInOptions() ;
    /*Column(
        mainAxisAlignment: MainAxisAlignment.center,
       
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "I am a,",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SelectYou(
            text: " Blood Donor",
          ),
          SelectYou(
            text: "Patient",
          ),
        ],
      ),*/
  }
}
/*
class SelectYou extends StatelessWidget {
  String text;
  SelectYou({this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DonorLoginPage()));
        },
        child: Padding(
    padding: const EdgeInsets.symmetric(horizontal:18.0,vertical: 7),
    child: Material(
      color: Colors.transparent,
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue[700], Colors.blue[500]]),
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFF2D78FF),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontFamily: 'Quicksand'),
            ),
          ),
        ),
      ),
    ),
        ),
      );
  }
}*/
