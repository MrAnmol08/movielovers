// // ignore_for_file: prefer_const_constructors
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// //import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// //import 'package:google_nav_bar/google_nav_bar.dart';
// //import 'package:movielovers/Login.dart';
// //import 'package:movielovers/Login.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:movielovers/Login.dart';
// import 'package:movielovers/util/movielist.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final user = FirebaseAuth.instance.currentUser!;
//   List imagelist = [
//     {"id": 1, "image_path": 'assets/images/spider.jpeg'},
//     {"id": 2, "image_path": 'assets/images/avatar.jpg'},
//     {"id": 3, "image_path": 'assets/images/vadh.jpg'},
//   ];
//   final CarouselController carouselController = CarouselController();
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot){
//         if (snapshot.hasData){
//           return HomePage();
//         } else {
//           return login();
//         }
//       },
//     ),
    
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Movie Lovers', 
//         textAlign: TextAlign.start,
//          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 15),
         
//         ),
        
//         backgroundColor: Color.fromARGB(255, 123, 20, 20),
//         actions:[
//           Container(
//              padding: EdgeInsets.symmetric(horizontal: 12),
//               child: Icon(
//                 Icons.shopping_cart,
//                ),
//           ) 
//         ],
//       ),



          
//       //backgroundColor: Colors.grey[300], 
      
//       // ignore: dead_code
//       //@override
//       // Widget build (BuildContext){
//         body: Column(
//         children: [
            
//               Stack(
//                 children: [
                  
//                   InkWell(
//                     onTap:(() {
//                       print(currentIndex);
//                     } ),

//                     child: CarouselSlider(
//                       items: imagelist
//                       .map( 
//                         (item) => Image.asset(
//                           item['image_path'],
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                         ),
                        
//                       )
                      
                      
//                       .toList(),
//                       carouselController: carouselController,
//                       options: CarouselOptions(
//                         scrollPhysics: const BouncingScrollPhysics(),
//                        autoPlay: true,
//                        aspectRatio: 2,
//                        viewportFraction: 1,
//                        onPageChanged: (Index, reason) {
//                         setState(() {
//                           currentIndex = Index;
//                         });
//                        },
                        
//                       ),
//                     ),
                      
//                     ),
//                     Positioned(
//                       bottom: 10,
//                       left: 0,
//                       right: 0,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: imagelist.asMap().entries.map((entry)
//                         {
//                           print(entry);
//                           print(entry.key);

                         
//                           return GestureDetector(
//                             onTap: () => carouselController.animateToPage(entry.key),
//                             child: Container(
//                               width: currentIndex == entry.key ? 17 : 7,
//                               height: 7.0,
//                               margin: const EdgeInsets.symmetric(
//                                 horizontal: 3.0,
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 color: currentIndex == entry.key
//                                 ? Colors.red
//                                 : Colors.teal
//                               ),
//                             ),

//                           );
//                         }).toList(),
                         
//                       ) ,

                      

//                     ),
//                     ],
//                   ),
//                   SizedBox(height: 15),
//                   Text('Nepali Movies',
//                   textAlign: TextAlign.left,
//                   style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                     color: Colors.black,
                  


//                   ),
//                    ),
//                   // SizedBox(height: 5),
                 
//                   //   Row(
//                   //     children: [
//                   //       Column(
//                   //         children: [
//                   //           Container(
//                   //             width: 100,
//                   //             height: 100,
//                   //             padding: EdgeInsets.all(10),
                              
//                   //             decoration: BoxDecoration(
//                   //              color: Colors.grey,
//                   //              borderRadius: BorderRadius.circular(15),
//                   //             ),
//                   //             // child: Center(
//                   //             //   child: Image.asset(
//                   //             //     'assets/images/ajkb.jpg',
                               
//                   //             //   ),
//                   //             // ),
//                   //           ),
//                            // SizedBox(height:10),
//                         // Text(
//                         //   'Ainaa Jhyal Ko Putali',
//                         //   style: GoogleFonts.poppins(
//                         //     fontSize: 12,
//                         //     fontWeight: FontWeight.bold,
//                         //     color: Colors.grey[500],
//                         //   ),
//                         // ),

//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: const [
//                             Movielist(
//                               imagepath: 'assets/images/kabaddi.jpg',
//                                buttonText:'Kabaddi 3',
//                                ),

//                                Movielist(
//                               imagepath: 'assets/images/aama.jpg',
//                                buttonText:'Aama',
//                                ),

//                                Movielist(
//                               imagepath: 'assets/images/ghamadshere.jpg',
//                                buttonText:'Ghamad Shere',
//                                ),

//                                Movielist(
//                               imagepath: 'assets/images/jatrai_jatra.jpg',
//                                buttonText:'Jatrai Jatra',
//                                ),

//                                 Movielist(
//                               imagepath: 'assets/images/chadke.jpg',
//                                buttonText:'Chadke',
//                                ),

//                           ],
//                         )
//                         ),

                        
 



                          
                        
                        
                      
    
                          

                

                


//         ],
      
//         ) 
//     );
        
    
    
          
        
       
      
      
      
    
      
      
      
      
    
//       }
    
//   }

      
  
  
 