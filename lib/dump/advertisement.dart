import 'dart:async';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class Banner extends StatefulWidget {
  Banner({Key key}) : super(key: key);

  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<Banner> {
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
    Timer(Duration(seconds: 10), () {
      _bannerAd?.show();
    });
    return Container();
  }

  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-6206074243422299~3820761092');
    _bannerAd = createBannerAd();
  }
}
