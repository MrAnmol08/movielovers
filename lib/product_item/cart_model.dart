import 'package:flutter/material.dart';

class Cartmodel extends ChangeNotifier {

  //list of items on sale
  final List _productItems = [
    // [itemName, itemSize, itemPrice, imagePath]
    ["Pirati Tshirt", "Size: XL","20", "assets/images/Pirati_Tshirt.png"],
    ["Pirati Tshirt", "Size: X","10", "assets/images/Pirati_Tshirt.png" ],
    ["Radaban Tshirt", "Size: XXL", "15", "assets/images/radaban_tshirt.png" ],
    ["Kabaddi Tshirt", "Size: XL","10","assets/images/Kabaddi_Tshirt.png" ],
    ["Gopi Tshirt", "Size: XXL","20","assets/images/Gopi_Tshirt.png" ],
  ];

  // List of cart items
  List _cartItems =[];

  get productItems =>  _productItems;

  get cartItems => _cartItems;

  //add items to cart
  void addItemToCart(int index){
    _cartItems.add(_productItems[index]);
    notifyListeners();
  }

  
  // remove items from cart
  void removeItemFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index][3]++; // increment quantity of the item
    notifyListeners();
  }


  //calculate total price
  String calculateTotal(){
    double totalPrice = 0;
    for (int i=0; i< _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][2]);

    }

    return totalPrice.toStringAsFixed(2);

  }

  
}