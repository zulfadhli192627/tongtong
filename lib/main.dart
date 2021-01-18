import 'package:flutter/material.dart';
import 'package:tong_tong/loan/loanHome.dart';
import 'package:tong_tong/widget/receipt_scanner.dart';

void main() => runApp(MyApp());

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
        home: LoanPage(),
      );
  // Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.all(8),
  //       child: Column(
  //         children: [
  //           const SizedBox(height: 25),
  //           ReceiptScanner(),
  //           const SizedBox(height: 15),
  //         ],
  //       ),
  //     ),
  //   );
}
