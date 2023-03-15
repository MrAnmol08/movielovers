import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movielovers/Auth/auth_page.dart';
import 'package:movielovers/util/navbar.dart';
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
            return const Navbar();
          } else {
            return const AuthPage();
          }
        }
      )
        
        
      
    );
  }
}