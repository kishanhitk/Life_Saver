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
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            body: Form(
              key: _formkey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Enter email',
                        ),
                        validator: (value) =>
                            value.isEmpty ? 'Enter valid email-id' : null,
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        }),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Enter password',
                        ),
                        validator: (value) => value.length < 6
                            ? 'Enter password length > 5'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        }),
                    RaisedButton(
                      onPressed: () async {
                        loading = true;
                        if (_formkey.currentState.validate()) {}
                      },
                      child: Text('Register'),
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
