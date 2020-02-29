import 'package:bank/Services/auth.dart';
import 'package:bank/shared/const.dart';
import 'package:flutter/material.dart';

import 'package:bank/screens/Loading/loading_page.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _EmailRegister();
  }
}

class _EmailRegister extends State<Register> {
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingPage()
        : Scaffold(
            appBar: AppBar(
              title: Text('Register'),
              centerTitle: true,
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.add_to_home_screen,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.toggleView();
                    });
                  },
                  label: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            body: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                        decoration: loginFormDecoration,
                        validator: (value) =>
                            value.isEmpty ? 'Enter valid email-id' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                        obscureText: true,
                        decoration: loginFormDecoration.copyWith(
                            labelText: "Enter password",
                            prefixIcon: Icon(Icons.vpn_key)),
                        validator: (value) => value.length < 6
                            ? 'Enter password length > 5'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Hero(
                    tag: "FAB",
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      color: Color(0xFF2D78FF),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic _result =
                              await _auth.registerWithEmail(email, password);
                          if (_result == null) {
                            setState(() {
                              loading = false;
                              error = 'Enter valid email' ;
                            });
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  ),
                  FlatButton(
                    child: Text(''),
                    onPressed: () {
                      setState(() {
                        widget.toggleView();
                      });
                    },
                  )
                ],
              ),
            ),
          );
  }
}
