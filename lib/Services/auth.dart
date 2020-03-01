import 'package:bank/Services/database.dart';
import 'package:bank/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final _auth = FirebaseAuth.instance;

  User _fromFirebaseUser(FirebaseUser user) {
    return user != null ? User(id: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_fromFirebaseUser);
  }

  Future emailSignIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _fromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future registerWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      
      await DataBaseServices(uid: user.uid).updateDatabase(email, password);
      return _fromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      print('Failed to logout');
    }
  }
}
