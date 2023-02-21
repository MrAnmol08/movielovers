// ignore_for_file: prefer_const_constructors
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//import 'package:movielovers/Login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imagelist = [
    {"id": 1, "image_path": 'assets/images/spider.jpeg'},
    {"id": 2, "image_path": 'assets/images/avatar.jpg'},
    {"id": 3, "image_path": 'assets/images/vadh.jpg'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Movie Lovers', 
        textAlign: TextAlign.start,),
        backgroundColor: Color.fromARGB(255, 155, 19, 19),
        actions:[
          Container(
             padding: EdgeInsets.all(12),
              child: Icon(Icons.shopping_cart,
               ),
          ) 
        ],
          ),



          
      backgroundColor: Colors.grey[300],
      body: Column( children:[
        Stack(
          children: [
            

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
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagelist.asMap().entries.map((entry)
                  {
                    print(entry);
                    print(entry.key);
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                          ? Colors.red
                          : Colors.teal
                        ),
                      ),

                    );
                  }).toList(),
                   
                ) ,

              ),
              ],
            ),
          ],



            
      //        //Using google navigation bar
      //       backgroundColor: Color.fromARGB(255, 246, 244, 244),//Color.fromARGB(255, 251, 248, 248), 
      //       color: Color.fromARGB(255, 3, 3, 3), // icon color
      //       activeColor: Color.fromARGB(255, 247, 162, 3), //after selected color
      //       tabBackgroundColor: Color.fromARGB(255, 155, 19, 19), //after selected background color
      //       gap: 9,
      //       padding: EdgeInsets.all(18),
            
            
      //       // ignore: prefer_const_literals_to_create_immutables
      //       tabs:[
      //         GButton(
      //           icon: Icons.home,
      //         text: 'Home', // Home icon with name
      //         ),
      //         GButton(
      //           icon: Icons.movie_outlined,
      //         text: 'Ticket',), // Ticket icon with name
      //         GButton(
      //           icon: Icons.production_quantity_limits,
      //         text: 'Product', //Product icon with name
      //         ),
      //         GButton(
      //           icon: Icons.supervised_user_circle,
      //         text: 'You', //You icon with name 
            
      
        
       
           
           
      // );

      
  
  
 