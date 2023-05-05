// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/Admin/AddMovie/uploaddetails.dart';
import 'package:movielovers/Admin/adminhome.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({super.key});

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final _nameController = TextEditingController();
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
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Color.fromARGB(255, 44, 54, 87),
          ),
          onPressed: () {
            Navigator.pop(context);
          } 
        ),
        title: const Text(
          'Movie Review',
          style: TextStyle(
            color: Color.fromARGB(255, 44, 54, 87),
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
           
            SizedBox(height: 5),
            Container(
              width: 350,
              height: 60, // set a specific height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Upload()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'New Movie Review',
                     style: TextStyle(
            color: Color.fromARGB(255, 44, 54, 87),
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
           
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Movie Reviews',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 54, 63, 96),
                    ),
                  ),
                )
              ],
            ),
            Divider(height: 1, thickness: 2),
          ],
        ),
      ),
    );
  }
}
