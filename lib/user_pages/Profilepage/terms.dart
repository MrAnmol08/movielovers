// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/user_pages/Profilepage/termsdata.dart';


class Term extends StatefulWidget {
  const Term({super.key});

  @override
  State<Term> createState() => _TermState();
}

class _TermState extends State<Term> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, 
        icon:const  Icon(Ionicons.arrow_back_sharp), 
        color:const Color.fromARGB(255, 54, 63, 96), ),
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
        
        title: Text('Terms & Condition',
        style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(terms),
            )
          ],
          
            
            
          
        ),
      ),
    );
  }
}