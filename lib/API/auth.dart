import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:tong_tong/API/database.dart';
import 'package:tong_tong/model/user.dart';
import 'package:flutter_session/flutter_session.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(email: user.email) : null;
  }

  //change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in email & pw
  Future signInWithEmailAndPassword(LoginData data) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      FirebaseUser user = result.user;
      await FlutterSession().set("email", data.name);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with email & pw
  Future registerWithEmailAndPassword(LoginData data) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: data.name, password: data.password);
      FirebaseUser user = result.user;
      //create doc for user using email
      await DatabaseService(email: data.name).updateUserData('dummy');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
