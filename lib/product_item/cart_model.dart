import 'package:flutter/material.dart';
import 'package:movielovers/product_item/items.dart';
import 'package:provider/provider.dart';

// class Item{
//   final String itemName;
//   final String itemSize;
//   final String itemPrice;
//   final String imagePath;
  

//   Item({
//   required this.itemName,
//   required this.itemSize,
//   required this.itemPrice,
//   required this.imagePath,
//  });


// }
 

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
  final List _cartItems = [];
  
  late BuildContext context;

 get productItems =>  _productItems;

 get cartItems => _cartItems;
  

  //add items to cart
  void addItemToCart(int index){
    _cartItems.add(_productItems[index]);
    notifyListeners();
    // _cartItems.add(_productItems[index]);
    // notifyListeners();
  }

  void increaseproduct(int index) {
  // Check if the product is already in the cart
  int existingIndex = _cartItems.indexWhere((item) => item.id == _productItems[index].id);

  if (existingIndex != 1) {
    // If the product is already in the cart, increase its quantity
    _cartItems[existingIndex].quantity++;
  } else {
    // If the product is not in the cart, add it with a quantity of 1
    // var value;
    _cartItems.add(items(
     itemName: _productItems[index][0], 
     itemSize: _productItems[index][1],
     itemPrice: _productItems[index][2],
     imagePath: _productItems[index][3],

     onPressed: (){
                    Provider.of<Cartmodel>(
                      context, listen: false)
                    .addItemToCart(index);
                  } ,
    ));
  }

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

  // void increaseProduct(int index){
  //   _cartItems[]
  // }


  //calculate total price
  String calculateTotal(){
    double totalPrice = 0;
    for (int i=0; i< _cartItems.length; i++){
      totalPrice += double.parse(_cartItems[i][2]);

    }

    return totalPrice.toStringAsFixed(2);

  }

  
}