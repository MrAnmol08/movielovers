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
        backgroundColor: Colors.transparent,
         elevation: 0,
         shadowColor: Colors.grey.withOpacity(1),
        bottom: PreferredSize(
           // ignore: prefer_const_constructors
           preferredSize: Size.fromHeight(4),
           child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                )
              )
            ),
           ),
           ),
           leading: IconButton(
          icon: const Icon(Icons.arrow_back,
          size: 30,
          color: Color.fromARGB(255, 54, 63, 96),
          
          ),
          onPressed: () => Navigator.pop(context,
          // MaterialPageRoute(builder: (context) =>  HomePage( () {  },)),
          ),
          //  MaterialPageRoute(builder: (context) =>  login(showRegisterPage: () {  },)),
           
        ),
        title: const Text('You',
        style: TextStyle(color: Color.fromARGB(255, 54, 63, 96),
        fontWeight: FontWeight.bold,
        fontSize: 25,
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