import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../product_item/cart_model.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<Cartmodel>(context);
    final productItems = cartModel.productItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(1),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Color.fromARGB(255, 44, 54, 87),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product Order',
          style: TextStyle(
            color: Color.fromARGB(255, 44, 54, 87),
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productItems.length,
              itemBuilder: (context, index) {
                final item = productItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(item[3]), // Item image
                    title: Text(item[0]), // Item name
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item[1]), // Item size
                        const Text("Username: Aaisha Ranjit"),
                        const Text("Location: Baneshwor"),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isCompleted = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _isCompleted ? Colors.green : Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: Text(
                          _isCompleted ? 'Completed' : 'Complete Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'All the orders are presented here',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 54, 87),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
