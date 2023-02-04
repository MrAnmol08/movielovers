import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      
      backgroundColor: Colors.white,
    
      body: SafeArea(
        
        
        child: Center(
          //child: SingleChildScrollView(
            child: Column( 
              
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children:[

                const SizedBox(height: 5,),
                Image.asset('assets/images/login.png',
                height: 200,
                width: 200,),
              ]
            )
        )
    )
        );
      
  
  }
}