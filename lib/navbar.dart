import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alumnus',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        leading: Icon(
          Icons.sort,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 222, 218, 218),
                    contentPadding: EdgeInsets.only(right: 30),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(right: 16, left: 24),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    )),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.0),
            Container(
              height: 200.0,
              child: GridView(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3/2),
              children: <Widget>[
                _gridItem('assests/login.png'),
                _gridItem('assests/login.png'),
                _gridItem('assests/login.png'),
                _gridItem('assests/login.png'),
                _gridItem('assests/login.png'),
                _gridItem('assests/login.png'),

              ],
              ),
            )
          ],
        ),
      ),
    );
  } //widget built

    _gridItem(img){
    return Column(
      children: <Widget>[
        CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              img,
              // size: 16.0,
              // color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue.withOpacity(0.9),
        ),
        SizedBox(height: 10.0),
        Text(
          "Birthday",
        style: TextStyle(),
        )

      ],

    );

  }
} // homepage