import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/user_pages/Home_page.dart';
import 'package:movielovers/product_item/product.dart';
import 'package:movielovers/user_pages/MovieTicket/ticket.dart';
import 'package:movielovers/user_pages/ticket.dart';
import 'package:movielovers/user_pages/Profilepage/you-page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int navindex = 0;
  final screen = [const HomePage(), ChooseSeat(), const Product(), const Youpage(), ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 54, 63,96),
            fontWeight: FontWeight.bold,
          ),
          unselectedItemColor: const Color.fromARGB(255, 54, 63, 96),
          selectedItemColor: const Color.fromARGB(255, 166, 41, 41),
          selectedLabelStyle: const TextStyle(
              color: Color.fromARGB(255, 160, 55, 55),
              fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          currentIndex: navindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon( Ionicons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.ticket),
              label: 'Ticket',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.shirt,
              ),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person),
              label: 'You',
            ),
          ],
          // ignore: unnecessary_this
          onTap: (index) => setState(() => this.navindex = index),
          ),
          body: screen[navindex],
    );
  }
}