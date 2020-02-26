import 'package:bank/screens/Auth/login_page.dart';
import 'package:bank/screens/Auth/register_page.dart';
import 'package:flutter/material.dart';

class SignInOptions extends StatefulWidget {
  @override
  _SignInOptionsState createState() => _SignInOptionsState();
}

class _SignInOptionsState extends State<SignInOptions> {
  bool _regPage = false;
  void toggleView() {
    setState(() {
      _regPage = !_regPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _regPage
        ? Register(toggleView: toggleView)
        : LoginPage(toggleView: toggleView);
  }
}
