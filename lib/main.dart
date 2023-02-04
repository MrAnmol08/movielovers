import 'package:flutter/material.dart';
import 'package:movielovers/Login.dart';
import 'package:movielovers/RegisterPage.dart';



void main() => runApp(const SplashScreen());

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Lovers',
      home: RegisterPage(),
      
     
    );
  }
}
