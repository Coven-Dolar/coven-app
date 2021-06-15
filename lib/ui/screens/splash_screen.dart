import 'dart:async';

import 'package:coven/News/ui/screen/news_list_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  final splashDelay = 5;

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
        backgroundColor: Color.fromRGBO(0, 146, 205, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Image.asset('assets/images/splash.png', width: 250),
              ),
              Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ))
            ],
          ),
        ));
  }
}
