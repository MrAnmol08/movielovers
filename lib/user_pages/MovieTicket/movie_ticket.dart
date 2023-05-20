import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'Email.dart';

class MovieTicketPage extends StatefulWidget {
  const MovieTicketPage({Key? key}) : super(key: key);

  @override
  _MovieTicketPageState createState() => _MovieTicketPageState();
  
}

class _MovieTicketPageState extends State<MovieTicketPage> {
  List <String> _selectedSeat = [];
  late List<bool> _seatStatus;
  late String _email;
  

  @override
  void initState() {
    super.initState();
    _seatStatus = List.generate(100, (index) => false);
  }

  void _toggleSeatSelection(int seatNumber) async {
    final seatRef = FirebaseFirestore.instance.collection('seats').doc('seat$seatNumber');
    final seatDoc = await seatRef.get();
    if (seatDoc.exists) {
      final seatData = seatDoc.data();
      if (seatData != null && seatData.containsKey('email') && seatData['email'] != null) {
        // Seat already booked, do not allow selection
        return;
      }
    }
    
    setState(() {
      _seatStatus[seatNumber] = !_seatStatus[seatNumber];
      if (_seatStatus[seatNumber]){
        _selectedSeat.add ('seat${seatNumber + 1}');
      } else {
        _selectedSeat.remove('seat${seatNumber + 1}');
      }
      
    });

    await seatRef.set({'status': _seatStatus[seatNumber],
    });
  }

  Future<List<bool>> _fetchSeatStatus() async {
    final seatStatusList = List<bool>.filled(100, false);

    for (int i = 0; i < seatStatusList.length; i++) {
      final seatRef = FirebaseFirestore.instance.collection('seats').doc('seat$i');
      final seatDoc = await seatRef.get();

      if (seatDoc.exists) {
        final seatData = seatDoc.data();
        final seatStatus = seatData!['status'] as bool;
        seatStatusList[i] = seatStatus;
      }
    }

    return seatStatusList;
  }

  void _bookSeats() async {
    List<String> selectedSeats = [];
    for (int i = 0; i < _seatStatus.length; i++) {
      if (_seatStatus[i]) {
        selectedSeats.add('Seat ${i + 1}');
      }
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // User not authenticated, handle accordingly
      return;
    }

  final userEmail = user.email; // Email address of the current user
  // Send the email
  if (userEmail == null) {
    // User email is null, handle accordingly
    return;
  }


  final emailSubject = 'Movie Seat Booking Confirmation';
  final emailBody = 'Thank you for booking seats. Your seat numbers are: ${selectedSeats.join(', ')}';

  try {
    final Email email = Email(
      body: emailBody,
      subject: emailSubject,
      recipients: [userEmail],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
    print('Email sent successfully');
  } catch (error) {
    print('Error sending email: $error');
    // Handle the error
  }

  

   

    for (String seat in selectedSeats) {
      final seatRef = FirebaseFirestore.instance.collection('seats').doc(seat);
      final seatDoc = await seatRef.get();
      final seatData = seatDoc.data();
      if (seatData != null && seatData.containsKey('email') && seatData['email'] != null) {
        // Seat already booked, skip storing the seat information
        continue;
      }
      await seatRef.set({
        'status': true,
        
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seats booked'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Your selected seats have been booked:'),
                const SizedBox(height: 16),
                Text(selectedSeats.join(', ')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
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
      _selectedSeat.clear();
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
                ),
              ),
            ),
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
              const Text(
                'Movie Time: 4:00 AM',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Movie Name: LOD',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Hall: CDC Cinemas',
                style: TextStyle(fontSize: 18),
              ),
              Image.asset('assets/images/lord.jpg'),
              const SizedBox(height: 16),
              FutureBuilder<List<bool>>(
                future: _fetchSeatStatus(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error loading seat status');
                  } else if (snapshot.hasData) {
                    final seatStatusList = snapshot.data!;
                    return GridView.count(
                      crossAxisCount: 10,
                      shrinkWrap: true,
                      children: List.generate(100, (index) {
                        final isSeatBooked = seatStatusList[index];
                        final isSeatSelected = _seatStatus[index];
                        final isSeatSelectable = !isSeatBooked && !isSeatSelected;
                        Color seatColor = isSeatBooked ? Colors.red : isSeatSelectable ? Colors.green : Colors.grey;

                        return InkWell(
                          onTap: () {
                            if (isSeatSelectable) {
                              _toggleSeatSelection(index);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            color: seatColor,
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: isSeatSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _bookSeats,
                child: const Text('Book Seats'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
