// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/product_item/items.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
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
                )
              )
            ),
           ),
           ),
        
        title: Text('Product',
        style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon( Ionicons.cart_outline,
                color: Color.fromARGB(255, 54, 63, 96),
                size: 32,
               ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            items(),
          ],
          ),
      ),
    );
  }
}