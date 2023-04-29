// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:movielovers/payment/payment.dart';
// import 'package:movielovers/product_item/product.dart';

// class Userdetails extends StatefulWidget {
//   const Userdetails({super.key});

//   @override
//   State<Userdetails> createState() => _UserdetailsState();
// }

// class _UserdetailsState extends State<Userdetails> {

//   final _phoneController = TextEditingController();
//   final _locationController = TextEditingController(); 

//   @override
//   void dispose() {
//     _phoneController.dispose();
//     _locationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         shadowColor: Colors.grey.withOpacity(1),
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(4),
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//               color: Colors.grey.withOpacity(0.5),
//               width: 1,
//             ))),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color.fromARGB(255, 54, 63, 96),
//           ),
//           onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Product()),
//                 ),
//           //  MaterialPageRoute(builder: (context) =>  login(showRegisterPage: () {  },)),
//         ),
//         title: const Text(
//           'Delivery Details',
//           style: TextStyle(
//             color: Color.fromARGB(255, 54, 63, 96),
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SafeArea(child: Center(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(mainAxisAlignment:
//            MainAxisAlignment.start,children: [
//             // const SizedBox(
//             //   height: 20,
//             // ),
//             Image.asset(
//               'assets/images/userdetail.gif',
//               height: 200,
//               width: 200,
//             ),
//              const Text(
//               'Please Fill the details below for delivery',
//               style: TextStyle(
//                 color: Color.fromARGB(255, 54, 63, 96),
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),

//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextField(
//                 controller: _phoneController,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   hintText: 'Phone Number',
//                   fillColor: Color.fromARGB(255, 253, 253, 253),
//                   filled: true,
//                   prefixIcon: Icon(
//                     Icons.phone,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextField(
//                 controller: _locationController,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   hintText: 'Location',
//                   fillColor: Color.fromARGB(255, 253, 253, 253),
//                   filled: true,
//                   prefixIcon: Icon(
//                     Icons.map,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 22),
//               child: GestureDetector(
//                 onTap:(){payWithKhalti(context);
//                 }, 

//                 child: Container(
//                   padding: const EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                       color: const Color.fromARGB(255, 241, 24, 8),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: const Center(
//                     child: Text('Submit',
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 247, 247, 247),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         )),
//                   ),
//                 ),
//               ),
//             ),



//           ],),
//         )
//       )),
//     );
    
//   }
// }