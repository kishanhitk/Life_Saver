import 'package:bank/screens/Auth/auth_landing.dart';
import 'package:bank/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' ;
import 'package:bank/model/user.dart' ;

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context) ;
    if (user == null)
      return SignInOptions() ;
    else
      return HomePage() ;
  }
}