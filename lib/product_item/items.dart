// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielovers/product_item/single_product.dart';

class items extends StatelessWidget {
  final String itemName;
  final String itemSize;
  final String itemPrice;
  final String imagePath;
  void Function()? onPressed;

   items({
    required this.itemName,
    required this.itemSize,
    required this.itemPrice,
    required this.imagePath,
    required this.onPressed,

  }
  );

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
       child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black,
          width: 1.2),
          // color: Color.fromARGB(255, 230, 227, 227),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image 
          Image.asset(imagePath,
          height: 100,
          ),
         
          //itemName
          Text(itemName,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
          ),
           
          //itemSize
          Text(itemSize),
       
          //itemPrice
          MaterialButton(
            onPressed: onPressed,
          color: const Color.fromARGB(255, 241, 24, 8),
          child: Text(itemPrice,
          style: GoogleFonts.openSans(
             fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 245, 245, 247),
          ),
          ),
          ),
          ],
        ),
       ),
     );
    //   
  }
}