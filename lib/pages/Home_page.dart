// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/ticket.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int navindex = 0;
  final user = FirebaseAuth.instance.currentUser!;
  List imagelist = [
    {"id": 1, "image_path": 'assets/images/spider.jpeg'},
    {"id": 2, "image_path": 'assets/images/avatar.jpg'},
    {"id": 3, "image_path": 'assets/images/vadh.jpg'},
    {"id": 4, "image_path": 'assets/images/bhool.jpg'},
    {"id": 4, "image_path": 'assets/images/laathi.jpeg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 216, 212, 212),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 233, 233),
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Movie Lovers',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color.fromARGB(255, 54, 63, 96),
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
          ),
        ),

        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.shopping_cart,
              color: Color.fromARGB(255, 54, 63, 96),
              size: 30,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Stack(
            children: [
              InkWell(
                onTap: (() {
                  print(currentIndex);
                }),
                child: CarouselSlider(
                  items: imagelist
                      .map(
                        (item) => Image.asset(
                          item['image_path'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (Index, reason) {
                      setState(() {
                        currentIndex = Index;
                      });
                    },
                  ),
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
                print(entry);
                print(entry.key);

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
          
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Movies Reviews',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 103, 96, 96),
                  ),
                ]),
          ),
          
          SizedBox(
            height: 100,
             width: 300,
            
            child: GridView.builder(
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1/1.3),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.blueAccent,
                  ),
                );
              },
            ),
          ),
        ]),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(
            color: Color.fromARGB(
              255,
              54,
              63,
              96,
            ),
            fontWeight: FontWeight.bold,
          ),
          unselectedItemColor: Color.fromARGB(255, 54, 63, 96),
          selectedItemColor: Color.fromARGB(255, 166, 41, 41),
          selectedLabelStyle: const TextStyle(
              color: Color.fromARGB(255, 160, 55, 55),
              fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {});
            navindex = index;
          },
          currentIndex: navindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(child: Icon(Ionicons.ticket)),
              label: 'Ticket',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.shirt,
              ),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Ionicons.person,
              ),
              label: 'You',
            ),
          ]),
    );
  }
}
