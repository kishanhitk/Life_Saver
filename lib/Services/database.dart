import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class DataBaseServices {
  final String uid;
  FirebaseMessaging _messaging = FirebaseMessaging();
  DataBaseServices({this.uid});

  final CollectionReference _doc = Firestore.instance.collection('users');

  Future updateDatabase(
      {String email,
      String password,
      String name,
      String city,
      String token,
      String blood,
      String state}) async {
    _messaging.subscribeToTopic(blood);
    return await _doc.document(uid).setData({
      'userId': uid,
      'email': email,
      'password': password,
      'name': name,
      'bloodGroup': blood,
      'city': city,
      'state': state,
      'token': token
    });
  }

  Future updateProfile(
      String name, String bloodGroup, String city, String state) async {
    return await _doc.document(uid).updateData(
      {
        'name': "Enter name",
        'bloodGroup': "Enter group",
        'city': "Enter City",
        'state': "Enter State",
      },
    );
  }

  Future updateToken(String token) async {
    return await _doc.document(uid).updateData(
      {
        "token": token,
      },
    );
  }
}
