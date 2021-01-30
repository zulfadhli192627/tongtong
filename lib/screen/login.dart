import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterLogin(
        onLogin: (_) => Future(null),
        onSignup: (_) => Future(null),
        onRecoverPassword: (_) => null,
        title: 'Tong Tong',
        theme: LoginTheme(
          primaryColor: Colors.grey[900],
          accentColor: Colors.white,
          titleStyle: TextStyle(fontFamily: 'Quicksand'),
        ),
        emailValidator: (error) {
          return error + ' is not a valid email';
        },
      ),
    );
  }
}
