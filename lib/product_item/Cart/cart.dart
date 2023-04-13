import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/product_item/cart_model.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
          'Cart',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
      ),
      body: Consumer<Cartmodel>(
        builder:((context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: value.cartItems.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    // title: Text(value.productItems[index][0]),
                    leading: Image.asset(
                      value.cartItems[index][3],
                    ),
                    title: Text(
                      value.cartItems[index][0],
                      style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold, fontSize: 18,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
                    ),
                    subtitle: Text(
                       value.cartItems[index][2],
                      style: GoogleFonts.openSans(
                        fontSize: 12,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
                      ),


                  ),
                ),
              );
          },
          ),
            ),
          )
        ],
      );
      }
      ),
       ),
    );
  }
}