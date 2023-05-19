// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class items extends StatelessWidget {
  final String itemName;
  final String itemSize;
  final String itemPrice;
  final String imagePath;
  void Function()? onPressed;

  items({
    super.key,
    required this.itemName,
    required this.itemSize,
    required this.itemPrice,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1.2),
          // color: Color.fromARGB(255, 230, 227, 227),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image
            Image.asset(
              imagePath,
              height: 80,
            ),

            Divider(thickness: 2,),

            //itemName
            Text(
              itemName,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 54, 63, 96),
              ),
            ),
            Divider(thickness: 2,),

            //itemSize
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  itemSize,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 54, 63, 96),
                  ),
                ),
                Divider(),
                Text(
                  'Price:Rs$itemPrice',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 54, 63, 96),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            MaterialButton(
              onPressed: onPressed,
              minWidth: 100,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: const Color.fromARGB(255, 241, 24, 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Add to cart',
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
