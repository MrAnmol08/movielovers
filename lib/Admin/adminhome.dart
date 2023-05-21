import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielovers/Admin/AddMovie/Movie_Review.dart';
import 'package:movielovers/Admin/Product/Admin_Product.dart';
import 'package:movielovers/Admin/admin_ticket.dart';

import '../Auth/auth_page.dart';
import 'MovieADD/AddMovie.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.asset('assets/images/logofinal.png',
                  height: 50,
                  width: 50,),
                  const SizedBox(width: 10),
                  Text(
                    'Welcome Admin,',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: const Color.fromARGB(255, 54, 63, 96),
                    ),
                  ),
                  const SizedBox(width: 130,),
               InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Sign Out',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: const Text('Are you sure you want to sign out?'),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut().then((value) =>
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const AuthPage();
                                    },
                                    ),
                                    ),
                                    );
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                },
                    child: const Icon(Icons.logout,
                    size: 25,
                    color: Color.fromARGB(255, 241, 24, 8),
                    ),
                  ),
                  
                  
                ],
              ),
            ),
            // SizedBox(height: 5),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Image.asset(
            //       'assets/images/logofinal.png',
            //       height: 80,
            //       width: 80,
            //     )
            //   ],
            // ),
           
            const SizedBox(height: 10),
            GridView.count(physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
             crossAxisCount: 2,
             padding: const EdgeInsets.symmetric(horizontal: 12),
             children: [
              GestureDetector(
                onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: ((context) => AddMoviePage())));
                },
                child: _buildBox('Add Movie', Icons.movie)),
                
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) =>  MovieReviewListPage())));
                },
                child: _buildBox('Movie Review', Icons.movie)),
              GestureDetector
              ( onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) =>  AdminTicketPage())));
                },
                child: _buildBox('Movie Tickets', Icons.airplane_ticket)),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) =>  const AdminProduct())));
                },
                child: _buildBox('Product', Icons.people)),
             ],
             ),
          ],
        ),
      ),
    );
  }



 Widget _buildBox(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40,
          color:const Color.fromARGB(255, 54, 63, 96) ,),
         const  SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color:  Color.fromARGB(255, 54, 63, 96),
            ),
          ),
        ],
      ),
    );
  }
}