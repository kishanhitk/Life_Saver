import 'package:bank/Services/auth.dart';
import 'package:bank/screens/WelcomePage/welcome_page.dart';

import 'package:bank/screens/landingpage/landingpage.dart';
import 'package:flutter/material.dart';
import 'model/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  bool _welcomepage = true;

  void toggleView() {
    setState(() {
      _welcomepage = !_welcomepage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthServices().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Quicksand').copyWith(
            primaryColor: Color(0xFF2D78FF),
          ),
          // home: _welcomepage ? WelcomePage(toggleView: toggleView,) : LandingPage() ,
          home: _welcomepage? WelcomePage(toggleView: toggleView,):LandingPage(),
        ));
  }
}
