// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MovieTicketPage extends StatefulWidget {
//   const MovieTicketPage({super.key});

//   @override
//   _MovieTicketPageState createState() => _MovieTicketPageState();
// }

// class _MovieTicketPageState extends State<MovieTicketPage> {
//   List<bool> _seatStatus = List.generate(100, (index) => false);
//   late String _email;
//   final _formKey = GlobalKey<FormState>();

//   void _toggleSeatSelection(int seatNumber) async {
//     setState(() {
//       _seatStatus[seatNumber] = !_seatStatus[seatNumber];
//     });
//      final seatRef = FirebaseFirestore.instance.collection('seats').doc('seat$seatNumber');
//     await seatRef.update({'status': _seatStatus[seatNumber]});
//   }
//    Future<List<bool>> _fetchSeatStatus() async {
//     final seatStatusList = List<bool>.filled(100, false);

//     for (int i = 0; i < seatStatusList.length; i++) {
//       final seatRef = FirebaseFirestore.instance.collection('seats').doc('seat$i');
//       final seatDoc = await seatRef.get();

//       if (seatDoc.exists) {
//         final seatData = seatDoc.data();
//         final seatStatus = seatData!['status'] as bool;
//         seatStatusList[i] = seatStatus;
//       }
//     }

//     return seatStatusList;
//   }
    
    


//   void _bookSeats() {
//     List<String> selectedSeats = [];
//     for (int i = 0; i < _seatStatus.length; i++) {
//       if (_seatStatus[i]){
//         selectedSeats.add('Seat ${i +1}');
//       }
//     }
//     FirebaseFirestore.instance
//         .collection('booked_seats')
//         .doc('bookedSeats')
//         .set({'bookedSeats': selectedSeats});
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Seats booked'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 const Text('Your selected seats have been booked:'),
//                 const SizedBox(height: 16),
//                 Text(selectedSeats.join(', ')),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//     setState(() {
//       _seatStatus = List.generate(100, (index) => false);
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         shadowColor: Colors.grey.withOpacity(1),
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(4),
//           child: Container(
//             decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//               color: Colors.grey.withOpacity(0.5),
//               width: 1,
//             ))),
//           ),
//         ),
       
//         title: const Text(
//           'Movie Ticket',
//           style: TextStyle(
//             color: Color.fromARGB(255, 44, 54, 87),
//             fontWeight: FontWeight.bold,
//             fontSize: 21,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Movie Time: 4:00 AM',
//                 style: TextStyle(fontSize: 18),
//               ),
//               const Text(
//                 'Movie Name: LOD',
//                 style: TextStyle(fontSize: 18),
//               ),
//               const Text(
//                 'Hall: CDC Cinemas',
//                 style: TextStyle(fontSize: 18),
//               ),
              
//               SingleChildScrollView(
//                 child: SizedBox(
//                   height: 250,
//                   child: Image.asset(
//                     'assets/images/lord.jpg',
//                     fit: BoxFit.fitWidth,
//                     width: double.infinity,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               FutureBuilder<List<bool>>(
//                 future: _fetchSeatStatus(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Container(
//                       width: 24,
//                       height: 24,
//                       child: const CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return const Text('Error loading seat status');
//                   } else if (snapshot.hasData) {
//                     final seatStatusList = snapshot.data!;
//                     return GridView.count(
//                       crossAxisCount: 10,
//                       shrinkWrap: true,
//                       children: List.generate(100, (index) {
//                         return InkWell(
//                           onTap: () {
//                             _toggleSeatSelection(index);
//                           },
//                           child: Container(
//                             margin: const EdgeInsets.all(2),
//                             color: seatStatusList[index] ? Colors.red : Colors.green,
//                             child: Center(
//                               child: Text(
//                                 '${index + 1}',
//                                 style: TextStyle(
//                                   color: seatStatusList[index] ? Colors.white : Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     );
//                   } else {
//                     return const SizedBox();
//                   }
//                 },
//               ),
//               // GridView.count(
//               //   crossAxisCount: 10,
//               //   shrinkWrap: true,
//               //   children: List.generate(100, (index) {
//               //     return InkWell(
//               //       onTap: () {
//               //         _toggleSeatSelection(index);
//               //       },
//               //       child: Container(
//               //         margin: const EdgeInsets.all(2),
//               //         color: _seatStatus[index]  ? Colors.red : _seatStatus[index] ==1?  Colors.red: Colors.green,
//               //         child: Center(
//               //           child: Text(
//               //             '${index + 1}',
//               //             style: TextStyle(
//               //               color: _seatStatus[index]  ? Colors.white : Colors.black,
//               //               fontWeight: FontWeight.bold,
//               //             ),
//               //           ),
//               //         ),
//               //       ),
//               //     );
//               //   }),
//               // ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _bookSeats,
//                 child: const Text('Book Seats'),
//               ),
//               const SizedBox(height: 16),
//               // StreamBuilder(
//               //   stream: FirebaseFirestore.instance.collection('movie ticket').doc('booked seats').snapshots(),
//               //   builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
//               //     if (snapshot.hasData) {
//               //       final List<String> bookedSeats = List<String>.from(snapshot.data!['bookedSeats']);
//               //      return Text('Booked Seats: ${bookedSeats.join(',')}');
//               //   } else {
//               //     return SizedBox();
//               //   }
//               //   }
//               //   )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movielovers/product_item/UserDetail.dart';

class MovieTicketPage extends StatefulWidget {
  const MovieTicketPage({Key? key}) : super(key: key);

  @override
  _MovieTicketPageState createState() => _MovieTicketPageState();
}

class _MovieTicketPageState extends State<MovieTicketPage> {
  late List<bool> _seatStatus;
  late String _email;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _seatStatus = List.generate(100, (index) => false);
  }

  // void _toggleSeatSelection(int seatNumber) async {
  //   setState(() {
  //     _seatStatus[seatNumber] = !_seatStatus[seatNumber];
  //   });
  //   final seatRef = FirebaseFirestore.instance.collection('seats').doc('seat$seatNumber');
  //   await seatRef.update({'status': _seatStatus[seatNumber]});

  //   final updatedSeatStatusList = await _fetchSeatStatus();
  //    setState(() {
  //   _seatStatus = updatedSeatStatusList;
  // });


  // }
  void _toggleSeatSelection(int seatNumber) async {
  final seatRef = FirebaseFirestore.instance.collection('seats').doc('seat$seatNumber');
  final seatDoc = await seatRef.get();
  final seatData = seatDoc.data();

  if (seatData != null && seatData['booked']) {
    // Seat already booked, do not allow selection
    return;
  }

  setState(() {
    _seatStatus[seatNumber] = !_seatStatus[seatNumber];
  });

  await seatRef.update({'booked': _seatStatus[seatNumber]});
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

  void _bookSeats() async{
    // // Check if user is authenticated
    final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    // User not authenticated, handle accordingly
    return;
  }
    List<String> selectedSeats = [];
    for (int i = 0; i < _seatStatus.length; i++) {
      if (_seatStatus[i]) {
        selectedSeats.add('Seat ${i + 1}');
      }
    }

    for (final seat in selectedSeats) {
      FirebaseFirestore.instance.collection('booked_seats').doc(seat).set({
        'name': user.displayName,
        'email': user.email,
      });
    }
    // FirebaseFirestore.instance
    //     .collection('booked_seats')
    //     .doc('bookedSeats')
    //     .set({
    //       'bookedSeats': selectedSeats,
    //       'name': user.displayName,
    //       'email': user.email,
        
    //       });
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
              SingleChildScrollView(
                child: SizedBox(
                  height: 250,
                  child: Image.asset(
                    'assets/images/lord.jpg',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FutureBuilder<List<bool>>(
                future: _fetchSeatStatus(),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return _buildProgressIndicator();
                  // }
                    if (snapshot.hasError) {
                    return const Text('Error loading seat status');
                  } else if (snapshot.hasData) {
                    final seatStatusList = snapshot.data!;
                    return GridView.count(
                      crossAxisCount: 10,
                      shrinkWrap: true,
                      children: List.generate(100, (index) {
                        final isSeatBooked = seatStatusList[index];
                        final isSeatSelected = _seatStatus[index];
                        final isSeatSelectable = !isSeatBooked && !isSeatSelected;
                        return InkWell(
                          onTap: () {
                            if (isSeatSelectable){
                               _toggleSeatSelection(index);

                            }
                            
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            color: isSeatBooked ? Colors.red : isSeatSelected? Colors.grey: Colors.green,
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _bookSeats,
                child: const Text('Book Seats'),
              ),
              const SizedBox(height: 16),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('booked_seats')
                    .doc('bookedSeats')
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final List<String> bookedSeats =
                        List<String>.from(snapshot.data!['bookedSeats']);
                    return Text('Booked Seats: ${bookedSeats.join(',')}');
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
// Widget _buildProgressIndicator() {
//  return GridView.count(
//     crossAxisCount: 10,
//     shrinkWrap: true,
//     children: List.generate(100, (index) {
      
//       return Container(
//         margin: const EdgeInsets.all(2),
//         color: Colors.grey.withOpacity(0.5),
//         child: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }),
//   );
// }
