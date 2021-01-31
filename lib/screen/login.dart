import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:tong_tong/screen/homescreen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<String> _signIn(LoginData data) async {
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (context) => Homepage(),
      ),
    );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterLogin(
        onLogin: _signIn,
        onSignup: (_) => Future(null),
        onRecoverPassword: (_) => null,
        title: 'Tong Tong',
        theme: LoginTheme(
          primaryColor: Colors.grey[900],
          accentColor: Colors.white,
          titleStyle: TextStyle(fontFamily: 'Quicksand'),
        ),
        // emailValidator: (error) {
        //   return error + ' is not a valid email';
        // },
      ),
    );
  }
}
