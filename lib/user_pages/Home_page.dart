// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielovers/Admin/AddMovie/Movie_Review.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  final user = FirebaseAuth.instance.currentUser!;
  List imagelist = [
    {"id": 1, "image_path": 'assets/images/spider.jpeg'},
    {"id": 2, "image_path": 'assets/images/avatar.jpg'},
    {"id": 3, "image_path": 'assets/images/vadh.jpg'},
    {"id": 4, "image_path": 'assets/images/bhool.jpg'},
    {"id": 5, "image_path": 'assets/images/laathi.jpeg'},
  ];


  //  = ['asstes/images/kabaddi', 'asstes/images/chadke', 'asstes/images/ajkp', 'asstes/images/jatrai_jatra', 'asstes/images/ghamadshere.jpg' ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 236, 236),
      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 237, 231, 231),
        title: Center(
          child: Text(
            'Movie Lovers',
            style: TextStyle(
                color: Color.fromARGB(255, 54, 63, 96),
                fontWeight: FontWeight.w900,
                fontSize: 25),
          ),
        ),
      ),
      body: Column(children: [
        Stack(
          children: [
            CarouselSlider(
              items: imagelist
                  .map(
                    (item) => Container(
                      padding: EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                //autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagelist.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => carouselController.animateToPage(entry.key),
                  child: Container(
                    width: currentIndex == entry.key ? 17 : 9,
                    height: 9.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: currentIndex == entry.key
                            ? Color.fromARGB(255, 254, 21, 5)
                            : Color.fromARGB(255, 6, 1, 17)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        Row(
          children: [
            Text(
            ' Movie Reviews',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 22, color: Color.fromARGB(255, 54, 63, 96),
            ),
            ),
          ],
        ),
      //  SizedBox(height: 5),
       Expanded(child: MovieReviewListView())

      ],
      ),
    );
  }
}
