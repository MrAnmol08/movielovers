// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

 class SingleProduct extends StatelessWidget {
  String img;
  SingleProduct(this.img, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(1),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1,
            ))),
          ),
        ),
        leading: IconButton(
          icon: Icon(Ionicons.arrow_back_outline),
          color: Color.fromARGB(255, 54, 63, 96),
          iconSize: 30,
          onPressed: () => Navigator.of(context).pop(),
          ),
        
        title: Text(
          'Item',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top:30, bottom: 20 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset("assets/images/$img.png"),
                )
              ],
            ),
            ),
            ),
      ),
    );
  }
}