// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';


class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
  
}

class _ListState extends State<List> {
  //  final String title;
  //  final IconData icon;
  //  final VoidCallback onpress;
  //  final bool endIcon;
  //  final Color? textColor;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
            Icon(
                  Ionicons.settings_sharp,
                  size: 20,
                  color: Color.fromARGB(255, 92, 97, 118),
                ),
                SizedBox(width: 12),
            Text(
          'Change Password',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
            ),
            SizedBox(width: 140),
            Icon(
                  Ionicons.chevron_forward_outline,
                  size: 25,
                  color: Color.fromARGB(255, 116, 119, 129),
                ),

                
      
          
        ]
      
      ),
    );
  
  }
}


