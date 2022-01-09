import 'dart:async';

import 'package:coven_native/News/ui/screen/news_list_screen.dart';
import 'package:coven_native/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsListScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.blue,
                        AppColors.blueDart,
                      ],
                      begin: FractionalOffset(0.2, 0.0),
                      end: FractionalOffset(6, 0.6),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Image.asset('assets/images/logo.png', width: 250),
                    ),
                    Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                  ],
                ),
              )
          ,
        ));
  }
}
