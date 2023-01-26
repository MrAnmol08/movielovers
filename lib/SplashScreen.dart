import 'package:flutter/material.dart';

import 'LoginPage.dart';

// ignore: camel_case_types
abstract class _SplashScreenState extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashscreenState();

  _SplashscreenState() {}
}


class _SplashScreenoneState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: FittedBox(
          child: Image.asset('assets/logo.png'),
        ),
      ),
       ),
    );
  }
}

class _SplashScreentwoState extends State {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}


