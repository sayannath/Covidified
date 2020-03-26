import 'package:covidified/homePage.dart';
import 'package:covidified/loadingPage.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomSplash(
        imagePath: 'assets/images/logoCovid.jpg',
        backGroundColor: Color(0xff181818),
        animationEffect: 'fade-in',
        logoSize: 200,
        duration: 4500,
        type: CustomSplashType.StaticDuration,
        home: HomePage()
      ),
    );
  }
}
