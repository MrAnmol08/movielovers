import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:movielovers/you.dart';

class Youpage extends StatefulWidget {
  const Youpage({super.key});

  @override
  State<Youpage> createState() => _YoupageState();
}

class _YoupageState extends State<Youpage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            
          Navigator.pop(context);
          },
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // Text(
            //   "Logout",
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            //    ),
               MaterialButton(onPressed: ()
                {
                FirebaseAuth.instance.signOut();
               },
               color: const Color.fromARGB(255, 241, 24, 8),
               child: const Text('Logout'),
               ),
          ],
        ),
      ),
    );  }
}