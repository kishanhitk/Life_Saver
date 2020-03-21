import 'package:bank/Services/auth.dart';
import 'package:bank/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:bank/screens/Loading/loading_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final data = Firestore.instance;

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  State<StatefulWidget> createState() {
    return _EmailRegister();
  }
}

class _EmailRegister extends State<Register> {
  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem> dropdownitems = [];
    for (String bloodgroup in bloodgroups) {
      var newItem =
          DropdownMenuItem(child: Text(bloodgroup), value: bloodgroup);
      dropdownitems.add(newItem);
    }
    return dropdownitems;
  }

  String email = '';
  String name = "";
  String city = '';
  String state = '';
  String password = '';
  String error = '';
  String bloodgroup = 'B+';
  bool loading = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    getDropDownItems();

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
            body: Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 10),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: TextFormField(
                            decoration: loginFormDecoration.copyWith(
                                prefixIcon: Icon(Icons.person_outline),
                                labelText: "Name"),
                            validator: (value) =>
                                value.isEmpty ? 'Enter your name please' : null,
                            onChanged: (value) {
                              setState(() {
                                name = value;
                              });
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5),
                        child: DropdownButtonFormField(
                          itemHeight: 100,
                          value: bloodgroup,
                          decoration: loginFormDecoration.copyWith(
                              alignLabelWithHint: true,
                              isDense: true,
                              labelText: "Select Your Blood Group",
                              prefixIcon: Icon(Icons.person_pin)),
                          items: getDropDownItems(),
                          onChanged: (value) {
                            setState(() {
                              bloodgroup = value;
                            });
                            print(value);
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          child: TextFormField(
                            decoration: loginFormDecoration.copyWith(
                                prefixIcon: Icon(Icons.location_city),
                                labelText: "City"),
                            validator: (value) =>
                                value.isEmpty ? 'Enter your city please' : null,
                            onChanged: (value) {
                              setState(() {
                                city = value;
                              });
                            },
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: TextFormField(
                          decoration: loginFormDecoration.copyWith(
                            prefixIcon: Icon(Icons.map),
                            labelText: "State",
                          ),
                          validator: (value) =>
                              value.isEmpty ? 'Enter your state please' : null,
                          onChanged: (value) {
                            setState(() {
                              state = value;
                            });
                          },
                        ),
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
                              dynamic _result = await _auth.registerWithEmail(
                                  email,
                                  password,
                                  name,
                                  city,
                                  bloodgroup,
                                  state);
                              if (_result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'Enter valid email';
                                });
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Register',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
