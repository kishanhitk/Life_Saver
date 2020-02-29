import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  final String uid;

  DataBaseServices({this.uid});

  final CollectionReference _doc = Firestore.instance.collection('users');

  Future updateDatabase(String email, String password) async {
    return await _doc.document(uid).setData({
      'userId': uid,
      'email': email,
      'password': password,
      'name': "Enter name",
      'bloodGroup': "Enter group",
    });
  }
}
