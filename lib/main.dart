import 'package:bank/screens/homepage/homepage.dart';
import 'package:bank/screens/landingpage/landingpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Quicksand').copyWith(
        
        
        primaryColor: Color(0xFF2D78FF),
      ),
      home:LandingPage(),
    );
  }
}
