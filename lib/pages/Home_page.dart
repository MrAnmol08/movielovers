  
      // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';
//import 'package:movielovers/Login.dart';
//import 'package:movielovers/Login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';


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
      backgroundColor: Color.fromARGB(255, 216, 212, 212),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 251, 251),
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left:8),
          child: const Text('Movie Lovers', 
          textAlign: TextAlign.left,
           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25),
           
          ),
        ),
        
        
        
        actions:[
          Container(
             padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 30,
               ),
          ) 
        ],  
      ),

    

        
        

         
          
         
      
      
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5), 
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Column(
            children: [
                
                  Stack(
                    children: [
                      
                      InkWell(
                        onTap:(() {
                          print(currentIndex);
                        } ),
      
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
                       Positioned(
                          //bottom: 9,
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
                                  width: currentIndex == entry.key ? 17 : 9,
                                  height: 9.0,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: currentIndex == entry.key
                                    ? Color.fromARGB(255, 254, 21, 5)
                                    : Color.fromARGB(255, 6, 1, 17)
                                  ),
                                ),
      
                              );
                            }).toList(),
                             
                          ) ,
      
                          
      
                        ),
      
                      SizedBox(height:8),
      
                       Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                         child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              thickness: 1.0,
                              color: Color.fromARGB(255, 48, 45, 45),
                              height: 0.0,
                            ),
                            SizedBox(height: 5),

                               Text(' Nepali Movies',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                               ),
                               SizedBox(height: 5),

                               Divider(
                              thickness: 1.0,
                              color: Color.fromARGB(255, 48, 45, 45),
                              height: 0.0,
                            ),
                                ]
                                 ),
                       ),

                                Center(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
               MaterialButton(onPressed: ()
                {
                FirebaseAuth.instance.signOut();
               },
               color: const Color.fromARGB(255, 241, 24, 8),
               child: const Text('Logout'),
               ),
          ],
        


      
      
                      
      
            ] 
                        )  
                      ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        
        onTap: (index){
          setState(() {
            
          });
          navindex = index;

        },
        currentIndex: navindex,
        items: const [ 
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home,
            ),
            label: 'Home',
            
        ),
        BottomNavigationBarItem(
            icon: Icon(Ionicons.ticket,
            color: Color.fromARGB(255, 54, 63, 96),),
            label: 'Ticket',
        ),
        BottomNavigationBarItem(
            icon: Icon(Ionicons.shirt,
            color: Color.fromARGB(255, 54, 63, 96),),
            label: 'Product',
        ),
        BottomNavigationBarItem(
            icon: Icon(Ionicons.person,
            color: Color.fromARGB(255, 54, 63, 96),),
            label: 'You',
            
        ),
      ]),
     

  
                    
                    
                    
                    
          
          );
      

     
    
    
        
    
    
          
        
       
      
      
      
    
      
      
      
      
    
  
  }
  }