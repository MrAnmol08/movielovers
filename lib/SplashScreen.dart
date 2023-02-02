import 'package:flutter/material.dart';

import 'LoginPage.dart';

class SplashScreenState extends State { // Create the state class for SplashScreen
  @override// override the build method which returns the widget tree associated with SplashScreen
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build throws an error indicating that the build method is not yet 
    throw UnimplementedError();
  }
  //...
}

//create the state class which is associated with SplashScreen StatefulWidget
abstract class SplashScreenclassState extends StatefulWidget {
  const SplashScreenclassState({Key? key}) : super(key: key);

  // override createState method
  // which returns the newly created instance of _SplashScreenState class
  @override
  // ignore: no_logic_in_create_state
  SplashScreenState createState() => _SplashScreenState();
  
  // ignore: non_constant_identifier_names
  _SplashScreenState() {}
}


class _SplashScreenState extends State { // Create the state class for _SplashScreenone
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold widget provides a basic layout structure
      body: Center(  // Center widget aligns the child widgets to the center of the 
        child: SizedBox(
          width: 170, // Container widget allows for more flexible layout options
          height: 170,
          child: FittedBox(
          child: Image.asset('assets/images/logo.png'),
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
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const login()),
      );
    });
  }
  
 @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}


