import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/user_pages/Home_page.dart';
import 'package:movielovers/product_item/product.dart';
import 'package:movielovers/user_pages/MovieTicket/ticket.dart';
import 'package:movielovers/user_pages/Profilepage/you-page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}
class UserDetails{
  static String? name;

  static String? email;
  static String? uid;
}

class _NavbarState extends State<Navbar> {
  final user = FirebaseAuth.instance.currentUser;
  String? name = '';
  String? uid = '';
  String? email = '';

//   Stream<QuerySnapshot> get users {
//     return userCollection.snapshots();
//   }

//   get userCollection => null;
//   Future getCurrentUserData() async {
//     DocumentSnapshot ds = userCollection.doc(uid).get();
//   }

  Future<void> _getUserDetails() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    print(uid);
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final docRef = FirebaseFirestore.instance.collection("users").doc(uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        name = data['name'];
        email = data['email'];
        uid = data ['uid'];
        // print("userName" + name!);
        // print('email' + email!);
        UserDetails.name = name;
        UserDetails.email = email;
        UserDetails.uid = uid;
      },
      onError: (e) => print("Error getting document: $e"),
    );

   
  }
   @override
    void initState() {
      _getUserDetails();
      super.initState();
    }

  int navindex = 0;
  final screen = [
    const HomePage(),
     const ChooseSeat(),
      const Product(), 
      const Youpage(), ];

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
          body: IndexedStack(
            index: navindex,
            children: screen),
    );
  }
}