import 'package:bank/screens/Loading/loading_page.dart';
import 'package:bank/screens/homepage/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeLanding extends StatefulWidget {
  final String uid;
  HomeLanding({this.uid});

  @override
  _HomeLandingState createState() => _HomeLandingState();
}

class _HomeLandingState extends State<HomeLanding> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
          .collection('users')
          .document(widget.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingPage() ;
        } else {
          final _doc = snapshot.data['name'];
          if (_doc == 'Enter name') {
            return HomePage(uid: widget.uid);
          }
        }
        return Text('loading') ;
      },
    );
  }
}
