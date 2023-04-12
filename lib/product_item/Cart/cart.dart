import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

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
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text('item'),
            );

          }))
        ],
      ),
    );
  }
}