import 'package:flutter/material.dart';
//import 'package:movielovers/HomePage.dart';
import 'package:movielovers/Login.dart';
//import 'package:movielovers/Login.dart';
//import 'package:movielovers/HomePage.dart';
//import 'package:movielovers/Login.dart';
//import 'package:movielovers/RegisterPage.dart';
//import 'package:movielovers/RegisterPage.dart';
// ignore: unused_import
import 'package:movielovers/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';


void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp() );
}



//void main() => runApp(const SplashScreen());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
    @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Lovers',
      home: login(),
      
     
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

  
  
  //}
//}
