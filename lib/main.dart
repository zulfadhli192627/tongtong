import 'package:flutter/material.dart';
import 'package:tong_tong/screen/homescreen.dart';
import 'package:tong_tong/screen/login.dart';

void main() => runApp(MainPage(title: 'Tong Tong'));

class MyApp extends StatelessWidget {
  final String title = 'Text Recognition';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Login(),
      );
}
