import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
//import 'package:movielovers/you.dart';

class Youpage extends StatefulWidget {
  const Youpage({super.key});

  @override
  State<Youpage> createState() => _YoupageState();
}

class _YoupageState extends State<Youpage> {
  final user = FirebaseAuth.instance.currentUser;
  String? userName;

  @override
  void initState() {
    super.initState();
    //getUserData();

    Future<void> getUserData() async {
      final firebaseUser = await FirebaseAuth.instance.currentUser!;
      setState(() {
        userName = firebaseUser.displayName;
      });
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(onPressed:(){}, icon:const  Icon(Ionicons.arrow_back_sharp), color:const Color.fromARGB(255, 54, 63, 96), ),
        backgroundColor: Colors.transparent,
         elevation: 0,
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
        
        title: Text('Profile',
        style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                width: 80, height: 100,
                child: Image(image: AssetImage('assets/images/logofinal.png')),
              ),
              SizedBox(height: 10),
              Text(
                user?.displayName ?? ''),
              Text(
                user?.email ?? ''
              ),
              SizedBox(height: 10),
              Divider(color: Colors.white),
            ],
          ),
          

        ),



        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //        MaterialButton(onPressed: ()
        //         {
        //         FirebaseAuth.instance.signOut();
        //        },
        //        color: const Color.fromARGB(255, 241, 24, 8),
        //        child: const Text('Logout'),
        //        ),
        //   ],
        // ),
      ),
    );  }
}