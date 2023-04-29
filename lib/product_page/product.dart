import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<String> productName = [
    'Pirati Tshirt',
    'Radaban Tshirt',
    'Kabaddi Tshirt',
    'Gopi Tshirt'
  ];
  List<String> productSize = ['XXL', 'XL', 'X', 'XL'];
  List<int> productPrice = [20, 30, 50, 30];
  List<String> productImage = [
    'assets/images/Pirati_Tshirt.png',
    'assets/images/radaban_tshirt.png',
    'assets/images/Kabaddi_Tshirt.png',
    'assets/images/Gopi_Tshirt.png'
  ];
  

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
        title: Text(
          'Product',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        centerTitle: true,
        actions: const [
          Center(
            child: Badge(
              badgeStyle: BadgeStyle(
                badgeColor: Colors.green,
              ),
              badgeContent: Text(
                '0',
                style: TextStyle(color: Color.fromARGB(255, 54, 63, 96)),
              ),
              child: Icon(
                Ionicons.cart_outline,
                color: Color.fromARGB(255, 54, 63, 96),
                size: 30,
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: productName.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image(
                                  height: 150,
                                  width: 150,
                                  image: AssetImage(
                                      productImage[index].toString()),
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                    productName[index].toString(),
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 54, 63, 96),
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    "Size" +": "+ productSize[index].toString(),
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 54, 63, 96),
                                    ),
                                  ),
                                   const SizedBox(height: 5,),
                                   Text(
                                    'Rate' +" :" " Rs."  +  productPrice[index].toString(),
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 54, 63, 96),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      height: 35,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.green, 
                                        borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: Center(
                                        child: Text('Add to cart', 
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: const Color.fromARGB(255, 54, 63, 96),
                                        ),
                                        ),
                                      ),
                                    ),
                                  )
                                
                                    ],
                                  ),
                                )
                               
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
