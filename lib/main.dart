import 'package:coven_native/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'News/ui/screen/news_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/news-list': (context) => NewsListScreen()
      },
    );
  }
}
