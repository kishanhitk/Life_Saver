import 'package:flutter/material.dart';

final loginFormDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  prefixIcon: Icon(Icons.email),
  labelText: 'Enter e-mail',
);
List<String> bloodgroups = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
const String klocationAPI= "c90faade5689478382a5135f9848c1f3";