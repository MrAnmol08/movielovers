// import 'dart:core';

// import 'package:movielovers/product_page/product.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Future<void> addCartToOrder(Cart cart) async {
//   try {
//     await _firestore.collection('Order').add(cart.toMap());
//   } catch (e) {
//     //Handle the error here
//     print('Error adding cart to order: $e');
//   }
// }

// class Cart {
  
//   final String? productId;
//   final String? productName;
//   final int? initialPrice;
//   final int? productPrice;
//   final String? productSize;
//   final int? quantity;
 
//   final String? image;

//   Cart({
   
//    required this.productId,
//    required this.productName,
//    required this.initialPrice,
//    required this.productPrice,
//    required this.productSize,
//    required this.quantity,

//    required this.image,
//   });

//   Cart.fromMap(Map<dynamic, dynamic> res)
//   : productId = res['productId'],
//   productName = res['productName'],
//   initialPrice = res['initialPrice'],
//   productPrice = res['productPrice'],
//   productSize = res ['productSize'],
//   quantity = res ['quantity'],

//   image = res['image'];

//   Map<String, Object?> toMap(){
//     return{
//       'productName': productName,
//       'initialPrice': initialPrice,
//       'productPrice': productPrice,
//       'productSize': productSize,
//       'quantity': quantity,
      
//       'image': image,
//     };
//   }

//   then(Null Function(dynamic value) param0) {}
// }