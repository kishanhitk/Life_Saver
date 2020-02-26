import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function toggleView;
  LoginPage({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),

      // TODO: UI

      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter e-mail'),
              validator: (val) {
                return val.isEmpty ? 'Enter email' : null;
              },
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter password',
              ),
              validator: (value) =>
                  value.length < 6 ? 'Enter password length > 5' : null,
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
            ),
            RaisedButton(
              child: Text('Sign In'),
              onPressed: () {
                if (_formkey.currentState.validate()) {}
              },
            ),
            Text(error),
            FlatButton(
              child: Text('Create an account'),
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
