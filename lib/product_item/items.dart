// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielovers/product_item/single_product.dart';

class items extends StatelessWidget {

  List img = [
    'Bhasme Tshirt',
    'Bulbul Tshirt',
    'Kabaddi Tshirt',
    'Kabaddi-4 Tshirt',
    'Pirati Tshirt',
    

  ];

  items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.8, //(150/195),
      children: [
        for(int i=0; i<img.length; i++  )
         SingleChildScrollView(
           child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal:10) ,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 253, 250, 250),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 11, 11, 11).withOpacity(0.5),
                  
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SingleProduct(img[i])));
                  },
                  child: Image.asset("assets/images/${img[i]}.png", 
                   ),
                ),
                 SizedBox(height: 0), 
                 Padding(padding: EdgeInsets.only(bottom: 8),
                  child: Align(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            img[i],
                             style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 14, color: Color.fromARGB(255, 54, 63, 96),
                          ),),
                          SizedBox(height: 0),
                           Text(
                            "Price: Npr. 685",
                            
                               style: GoogleFonts.openSans(
                              // fontWeight: FontWeight.bold,
                              fontSize: 14, color: Color.fromARGB(255, 54, 63, 96),
                            ),),
                        ],
                      )
                    ),
                  )
                 ),
                
              ],
            ),
           ),
         )
      ],
    );
  }
}