import 'package:flutter/material.dart';
import 'package:movielovers/LoginPage.dart';
import 'package:movielovers/MyHomePage.dart';
import 'package:movielovers/RegisterPage.dart';
import "SplashScreen.dart";
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Lovers',
      home: LoginPage(),
      
     
    );
  }
}
