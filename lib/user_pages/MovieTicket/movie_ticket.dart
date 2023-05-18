import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTicketPage extends StatefulWidget {
  @override
  _MovieTicketPageState createState() => _MovieTicketPageState();
}

class _MovieTicketPageState extends State<MovieTicketPage> {
  List<bool> _seatStatus = List.generate(100, (index) => false);
  late String _email;
  final _formKey = GlobalKey<FormState>();

  void _toggleSeatSelection(int seatNumber) {
    setState(() {
      _seatStatus[seatNumber] = !_seatStatus[seatNumber];
    });
  }

  void _bookSeats() {
    List<String> _selectedSeats = [];
    for (int i = 0; i < _seatStatus.length; i++) {
      if (_seatStatus[i]){
        _selectedSeats.add('Seat ${i +1}');
      }
       //Return the selected seats
       Navigator.of(context).pop(_selectedSeats);


      // if (_seatStatus[i] ==1) {
      //   _selectedSeats.add('Seat ${i + 1}');
      //   _seatStatus[i] = 2;
      // }
    }
    FirebaseFirestore.instance
        .collection('movie ticket')
        .doc('booked seats')
        .set({'bookedSeats': _selectedSeats});
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seats booked'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your selected seats have been booked:'),
                SizedBox(height: 16),
                Text(_selectedSeats.join(', ')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    setState(() {
      _seatStatus = List.generate(100, (index) => false);
    });
  }


  @override
  Widget build(BuildContext context) {
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
            ))),
          ),
        ),
       
        title: const Text(
          'Movie Ticket',
          style: TextStyle(
            color: Color.fromARGB(255, 44, 54, 87),
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Movie Time: 4:00 AM',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Movie Name: LOD',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Hall: CDC Cinemas',
                style: TextStyle(fontSize: 18),
              ),
              
              SingleChildScrollView(
                child: Container(
                  height: 250,
                  child: Image.asset(
                    'assets/images/lord.jpg',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 10,
                shrinkWrap: true,
                children: List.generate(100, (index) {
                  return InkWell(
                    onTap: () {
                      _toggleSeatSelection(index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: _seatStatus[index]  ? Colors.red : _seatStatus[index] ==1?  Colors.red: Colors.green,
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            color: _seatStatus[index]  ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _bookSeats,
                child: Text('Book Seats'),
              ),
              const SizedBox(height: 16),
              // StreamBuilder(
              //   stream: FirebaseFirestore.instance.collection('movie ticket').doc('booked seats').snapshots(),
              //   builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              //     if (snapshot.hasData) {
              //       // final List<String> bookedSeats = List<String>.from(snapshot.data!['bookedSeats']);
              //      // return Text('Booked Seats: ${bookedSeats.join(',')}');
              //   } else {
              //     return SizedBox();
              //   }
              //   }
              //   )
            ],
          ),
        ),
      ),
    );
  }
}
