import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/product_item/UserDetail.dart';
import 'package:movielovers/product_item/cart_model.dart';
import 'package:movielovers/util/navbar.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Navbar()),
  );
},
          icon: const Icon(Ionicons.arrow_back_sharp),
          color: const Color.fromARGB(255, 54, 63, 96),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1,
            ))),
          ),
        ),
        title: Text(
          'Cart',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: const Color.fromARGB(255, 54, 63, 96),
          ),
        ),
      ),
      body: Consumer<Cartmodel>(
        builder: ((context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ListTile(
                            //title: Text(value.productItems[index][0]),
                            leading: Image.asset(
                              value.cartItems[index][3],
                              alignment: Alignment.bottomLeft,
                              //height: 82,
                            ),
                            title: Text(
                              value.cartItems[index][0],
                              style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: const Color.fromARGB(255, 54, 63, 96),
                              ),
                            ),
                            subtitle: Text('Rs.' + value.cartItems[index][2]),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    icon:
                                        const Icon(Ionicons.add_circle_outline),
                                    color: const Color.fromARGB(255, 27, 24, 63),
                                    onPressed: () {
                                    }
                                    //=>  Provider.of<Cartmodel>(context, listen: false)
                                    //         .increaseproduct(index),
                                    ),
                                    const Text('2'),
                                IconButton(
                                    icon: const Icon(
                                        Ionicons.remove_circle_outline),
                                    color: const Color.fromARGB(255, 63, 24, 56),
                                    onPressed: () {}
                                    //=>  Provider.of<Cartmodel>(context, listen: false)
                                    //         .increaseproduct(index),
                                    ),
                                    const SizedBox(width: 15),
                                IconButton(
                                  iconSize: 25,
                                  icon: const Icon(Ionicons.trash),
                                  color: const Color.fromARGB(255, 67, 67, 67),
                                  onPressed: () => Provider.of<Cartmodel>(
                                          context,
                                          listen: false)
                                      .removeItemFromCart(index),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(36),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 54, 63, 96),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              // fontSize: 18,
                              color: const Color.fromARGB(255, 246, 247, 249),
                            ),
                          ),
                          Text(
                            value.calculateTotal(),
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              // fontSize: 18,
                              color: const Color.fromARGB(255, 246, 247, 249),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Userdetails()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 246, 247, 249),
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text(
                                "Continue",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 18,
                                  color:
                                      const Color.fromARGB(255, 246, 247, 249),
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Ionicons.arrow_forward,
                                size: 20,
                                color: Color.fromARGB(255, 246, 247, 249),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
