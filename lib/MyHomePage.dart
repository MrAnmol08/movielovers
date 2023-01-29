import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home Page',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        //currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.local_play), label: "Ticket"),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Product"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "You"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 239, 169, 4),
        unselectedItemColor: const Color.fromARGB(255, 26, 2, 2),
        onTap: _onItemTapped,
       
      ),
    );
  }
}
