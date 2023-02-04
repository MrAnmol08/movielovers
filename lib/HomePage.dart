// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Navigation bar on homepage
      bottomNavigationBar: Container(
        
         color: Color.fromARGB(255, 255, 255, 255),
    
        child: Padding(
          
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: GNav( //Using google navigation bar
            backgroundColor: Color.fromARGB(255, 251, 248, 248), 
            color: Color.fromARGB(255, 3, 3, 3), // icon color
            activeColor: Color.fromARGB(255, 247, 162, 3), //after selected color
            tabBackgroundColor: Color.fromARGB(255, 212, 63, 63), //after selected background color
            gap: 9,
            padding: EdgeInsets.all(18),
            // ignore: prefer_const_literals_to_create_immutables
            tabs:[
              GButton(
                icon: Icons.home,
              text: 'Home', // Home icon with name
              ),
              GButton(
                icon: Icons.movie_outlined,
              text: 'Ticket',), // Ticket icon with name
              GButton(
                icon: Icons.shopping_cart,
              text: 'Product', //Product icon with name
              ),
              GButton(
                icon: Icons.supervised_user_circle,
              text: 'You', //You icon with name
              ),
            ]),
        ),
      ),
      );
    
  }
}
 