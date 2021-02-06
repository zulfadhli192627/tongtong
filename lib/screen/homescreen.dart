import 'dart:async';
import 'dart:ui';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tong_tong/services/auth.dart';
import 'package:tong_tong/model/user.dart';
import 'package:tong_tong/screen/billHome.dart';
import 'package:tong_tong/screen/lendHome.dart';
import 'package:tong_tong/screen/login.dart';
import 'package:tong_tong/services/database.dart';
import 'package:tong_tong/widget/loading.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool chooseSplit = true;
  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: 'ca-app-pub-6206074243422299/6285759440',
        size: AdSize.smartBanner,
        listener: (MobileAdEvent event) {
          print('Banner event: $event');
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: true);
    if (user != null) {
      print("User Email" + user.email.toString());
      Timer(Duration(seconds: 10), () {
        _bannerAd?.show();
      });

      return Scaffold(
          body: ListView(
        children: <Widget>[
          _top(user.email),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 400.0,
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 50,
                      child: IconButton(
                          icon: Icon(
                            Icons.receipt,
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BillHome(),
                              ),
                            );
                          }),
                      backgroundColor: Colors.deepOrange.withOpacity(0.9),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bill Split",
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 50,
                      child: IconButton(
                          icon: Icon(
                            Icons.money,
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoanPage(),
                              ),
                            );
                          }),
                      backgroundColor: Colors.deepOrange.withOpacity(0.9),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Loan",
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ));
    } else {
      return Loading();
    }
  }

  _top(String email) {
    return StreamBuilder<UserData>(
        stream: DatabaseService(email: email).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (userData != null) {
            return Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            //Put user photo here
                            backgroundImage: NetworkImage(userData.picUrl),
                            radius: 30,
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Hi," + userData.name,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          //sign out button here
                          SizedBox(
                            width: 120,
                          ),
                          FlatButton.icon(
                            icon: Icon(Icons.person),
                            label: Text('Log Out'),
                            onPressed: () {
                              AuthService().signOut();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-6206074243422299~3820761092');
    _bannerAd = createBannerAd()..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
