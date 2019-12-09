import 'package:flutter/material.dart';
import 'Home.dart';
import 'dart:async';
// import 'package:flutter_ui_splash_screen/homeScreen.dart';

void main() => runApp(Splash());

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new Home()
    },
    home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
  Navigator.of(context).pushReplacementNamed('/HomeScreen');
}

@override
void initState() {
  super.initState();
  startTime();
}

 @override
  Widget build(BuildContext context) {
  return new Scaffold(
    backgroundColor: Colors.white,
    body: new Center(
      child: Image.asset('images/ieeelogo.png')
    ),
  );
  }
}

