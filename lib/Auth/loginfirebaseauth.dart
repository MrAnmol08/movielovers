import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movielovers/Auth/auth_page.dart';
import 'package:movielovers/pages/Home_page.dart';
//import 'package:movielovers/Auth/auth_page.dart';
//import 'package:movielovers/HomePage.dart';

import 'package:movielovers/Auth/loginfirebaseauth.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData){
            return const HomePage();
          } else {
            return const AuthPage();
          }
        }
      )
        
        
      
    );
  }
}