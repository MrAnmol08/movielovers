// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/product_item/Cart/cart.dart';
import 'package:movielovers/product_item/cart_model.dart';
import 'package:movielovers/product_item/items.dart';
import 'package:provider/provider.dart';

class Product extends StatefulWidget {
// const Product({super.key});
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();

  
}

//khalti refrence id
  String refrenceId = "";

  
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
            ))),
          ),
        ),
        title: Text(
          'Product',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
              icon: Icon(
                Ionicons.cart_outline,
                color: Color.fromARGB(255, 54, 63, 96),
                size: 32,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
             child: Consumer<Cartmodel>(
              builder:(context, value, child) {
              return GridView.builder(
               shrinkWrap: true,
               
                itemCount: value.productItems.length,
                padding:EdgeInsets.symmetric(horizontal:1, vertical: 5) ,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 0.8,
                  ), 
              itemBuilder: (context, index){
                return items(
                  itemName: value.productItems[index][0], 
                  itemSize: value.productItems[index][1],
                  itemPrice: value.productItems[index][2],
                  imagePath: value.productItems[index][3],
                  onPressed: (){
                    Provider.of<Cartmodel>(
                      context, listen: false)
                    .addItemToCart(index);
                  } ,
                  );
              });

             },
             ),
             ),
        ],
      ),
      );
    
  }
}
