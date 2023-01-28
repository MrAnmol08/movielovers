import 'package:flutter/material.dart';

import 'LoginPage.dart';

class SplashScreenState extends State { // Create the state class for SplashScreen
  @override// override the build method which returns the widget tree associated with SplashScreen
  Widget build(BuildContext context) {
    // TODO: implement build throws an error indicating that the build method is not yet 
    throw UnimplementedError();
  }
  //...
}

//create the state class which is associated with SplashScreen StatefulWidget
abstract class SplashScreenclassState extends StatefulWidget {
  // override createState method
  // which returns the newly created instance of _SplashScreenState class
  @override
  SplashScreenState createState() => _SplashScreenState();
  
  _SplashScreenState() {}
}


class _SplashScreenoneState extends State { // Create the state class for _SplashScreenone
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget provides a basic layout structure
      body: Center(  // Center widget aligns the child widgets to the center of the 
        child: Container(
          width: 170, // Container widget allows for more flexible layout options
          height: 170,
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
    Future.delayed(Duration(seconds: 15), () {
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

