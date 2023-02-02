import 'package:flutter/material.dart';


// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor: Colors.white,
    
      body: SafeArea(
        
        child: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children:[
              SizedBox(height: 20,),
            Text('Welcome',
            style: 
            TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 36) ,),
            ]
          ),
        ),
      ) ,
      
    );
  }
}