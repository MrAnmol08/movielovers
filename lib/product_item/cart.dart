import 'package:flutter/material.dart';

class cart extends ChangeNotifier {

  //list of items on sale
  final List _productItems = [
    // [itemName, itemSize, itemPrice, imagePath]
    ["Pirati Tshirt", "Size: XL","Rs.20", "assets/images/Pirati_Tshirt.png"],
    ["Pirati Tshirt", "Size: X","Rs.10", "assets/images/Pirati_Tshirt.png" ],
    ["Radaban Tshirt", "Size: XXL", "Rs.15", "assets/images/radaban_tshirt.png" ],
    ["Kabaddi Tshirt", "Size: XL","Rs.10","assets/images/Kabaddi_Tshirt.png" ],
    ["Gopi Tshirt", "Size: XXL","Rs.20","assets/images/Gopi_Tshirt.png" ],
  ];

  get productItems =>  _productItems;
}