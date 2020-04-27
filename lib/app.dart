import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'AuthScreen.dart';

const PrimaryColor =  Color.fromRGBO(57, 146, 86, 1.0);

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        //canvasColor: Colors.transparent,
      ),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        //canvasColor: Colors.transparent,
      ),
      home: Scaffold(
        body: AuthScreen(),
      ),
    );
  }
}
/*
class AppDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        //canvasColor: Colors.transparent,
      ),
      home: Scaffold(
        body: BetFairHome(),
      ),
    );
  }
}*/