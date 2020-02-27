import 'package:bank/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:bank/shared/const.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Enter e-mail',
                ),
                validator: (val) {
                  return val.isEmpty ? 'Enter email' : null;
                },
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  prefixIcon: Icon(Icons.vpn_key),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
              ),
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
