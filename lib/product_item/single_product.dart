// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:movielovers/payment/payment.dart';

// class SingleProduct extends StatelessWidget {
//   final String img;
//   SingleProduct(this.img, {Key? key}) : super(key: key);

//   //khalti refrence id
//   String refrenceId = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[400],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Ionicons.arrow_back_outline),
//           color: Color.fromARGB(255, 54, 63, 96),
//           iconSize: 30,
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Item',
//           style: GoogleFonts.openSans(
//             fontWeight: FontWeight.bold,
//             fontSize: 24,
//             color: Color.fromARGB(255, 54, 63, 96),
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: Color.fromARGB(255, 255, 255, 255),
//             child: Center(
//               child: Image.asset(
//                 "assets/images/$img.png",
//                 width: MediaQuery.of(context).size.width / 1.4,
//               ),
//             ),
//           ),
//           SizedBox(height: 5),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(15.0),
//                   topRight: Radius.circular(15.0),
//                 ),
//                 color: Color.fromARGB(255, 252, 252, 252),
//               ),
//               //color: Color.fromARGB(255, 245, 246, 248),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text(
//                           img,
//                           style: GoogleFonts.openSans(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20,
//                             color: Color.fromARGB(255, 85, 93, 117),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text(
//                           'Movie dialogue tshirt from pashupatiprasad',
//                           style: GoogleFonts.openSans(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 71, 79, 104),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     color: Color.fromARGB(255, 103, 96, 96),
//                     thickness: 1,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text(
//                           'Size: ',
//                           style: GoogleFonts.openSans(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 116, 119, 129),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text(
//                           'XXL, XL ',
//                           style: GoogleFonts.openSans(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 71, 79, 104),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 30),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text(
//                           'Colour: White',
//                           style: GoogleFonts.openSans(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 71, 79, 104),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     color: Color.fromARGB(255, 103, 96, 96),
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Text(
//                           'Price: Npr. 685',
//                           style: GoogleFonts.openSans(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14,
//                             color: Color.fromARGB(255, 254, 21, 5),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     color: Color.fromARGB(255, 103, 96, 96),
//                     thickness: 1,
//                   ),
//                   SizedBox(height: 15),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       TextButton(
//                           onPressed: () {
                            
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 Color.fromARGB(255, 254, 21, 5)),
//                             minimumSize:
//                                 MaterialStateProperty.all<Size>(Size(150, 50)),
//                           ),
//                           child: Text(
//                             'Add to cart',
//                             style: GoogleFonts.openSans(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 248, 245, 245),
//                             ),
//                           )),
//                       SizedBox(width: 10),
//                       TextButton(
//                           onPressed: () {
//                             payWithKhalti(context);
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 Color.fromARGB(255, 122, 37, 112)),
//                             minimumSize:
//                                 MaterialStateProperty.all<Size>(Size(150, 50)),
//                           ),
//                           child: Text(
//                             'Buy Now',
//                             style: GoogleFonts.openSans(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Color.fromARGB(255, 246, 243, 247),
//                             ),
//                           )),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
