import 'dart:js';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:movielovers/product_item/cart_model.dart';

void saveOrderToFirebase(String phoneNumber, String location) {
  var cartItems = Provider.of<Cartmodel>(context as BuildContext, listen: false).cartItems;
  List<Map<String, dynamic>> products = [];

  for (var cartItem in cartItems) {
    products.add({
      'itemName': cartItem['itemName'],
      'itemSize': cartItem['itemSize'],
      'itemPrice': cartItem['itemPrice'],
      'imagePath': cartItem['imagePath'],
    });
  }

  FirebaseFirestore.instance.collection('orders').add({
    'phoneNumber': phoneNumber,
    'location': location,
    'amount': Provider.of<Cartmodel>(context as BuildContext, listen: false).calculateTotal(),
    'products': products,
  }).then((value) {
    // Success handling
  }).catchError((error) {
    // Error handling
    debugPrint(error.toString());
  });
}
