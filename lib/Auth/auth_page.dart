// import 'package:flutter/material.dart';
// import 'package:movielovers/Login.dart';
// import 'package:movielovers/RegisterPage.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({super.key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   bool showloginpage = true;

//   void toogleScreen(){
//     setState(() {
//       showloginpage = !showloginpage;
//     });

//   }
//   @override
//   Widget build(BuildContext context) {
//     if (showloginpage){
//       return login(showRegisterPage: toogleScreen );
//     } else {
//       return RegisterPage(showloginpage: toogleScreen,);
//     }
//   }
// }