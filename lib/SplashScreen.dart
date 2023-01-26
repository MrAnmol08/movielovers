import 'package:flutter/material.dart';

// ignore: camel_case_types
class _SplashScreenState {
  _SplashScreenState createState() => _SplashscreenState();
  
  // ignore: non_constant_identifier_names
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



