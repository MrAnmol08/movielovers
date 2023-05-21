// import 'package:flutter/material.dart';

// class AdminTicketPage extends StatefulWidget {
//   const AdminTicketPage({super.key});

//   @override
//   _AdminTicketPageState createState() => _AdminTicketPageState();
// }

// class _AdminTicketPageState extends State<AdminTicketPage> {
//   final List<bool> _seatStatus = List.generate(100, (index) => false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.transparent,
//          elevation: 0,
//          shadowColor: Colors.grey.withOpacity(1),
//          bottom: PreferredSize(
//            preferredSize: const Size.fromHeight(4),
//            child: Container(
//             decoration: BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(
//                   color: Colors.grey.withOpacity(0.5),
//                   width: 1,
//                 )
//               )
//             ),
//            ),
//            ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,
//           size: 30,
//           color: Color.fromARGB(255, 44, 54, 87),
//           ),
//           onPressed: () => Navigator.pop(context),
           
//         ),
//         title: const Text('Movie Ticket',
//         style: TextStyle(color: Color.fromARGB(255, 44, 54, 87),
//         fontWeight: FontWeight.bold, fontSize: 21,
//         ),
//         ),
        

        
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Text(
//                 'Seats Overview:',
//                 style: TextStyle(fontSize: 18),
//               ),
//               const SizedBox(height: 16),
//               GridView.count(
//                 crossAxisCount: 10,
//                 shrinkWrap: true,
//                 children: List.generate(100, (index) {
//                   return SeatItem(
//                     seatNumber: index + 1,
//                     isSelected: _seatStatus[index],
//                   );
//                 }),
//               ),
//               const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 23
//                     ),
//                     child: Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                           color: const Color.fromARGB(255, 241, 24, 8),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: const Center(
//                         child: Text('Restart',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 247, 247, 247),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             )),
//                       ),
//                     ),
//                   ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SeatItem extends StatelessWidget {
//   final int seatNumber;
//   final bool isSelected;

//   const SeatItem({super.key, 
//     required this.seatNumber,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(2),
//       color: isSelected ? Colors.red : Colors.green,
//       child: Center(
//         child: Text(
//           '$seatNumber',
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
        
//       ),
      
//     );
    
//   }
// }


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class AdminTicketPage extends StatefulWidget {
  @override
  _AdminTicketPageState createState() => _AdminTicketPageState();
}

class _AdminTicketPageState extends State<AdminTicketPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, 
        icon:const  Icon(Ionicons.arrow_back_sharp), 
        color:const Color.fromARGB(255, 54, 63, 96), ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
           // ignore: prefer_const_constructors
           preferredSize: Size.fromHeight(4),
           child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.5),
                  width: 1,
                )
              )
            ),
           ),
           ),
        
        title: Text('Movie Ticket Status',
        style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: const Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        centerTitle: true,
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
              const SizedBox(height: 16),
              FutureBuilder<List<bool>>(
                future: _fetchSeatStatus(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error loading seat status');
                  } else if (snapshot.hasData) {
                    final seatStatusList = snapshot.data!;
                    return GridView.count(
                      crossAxisCount: 10,
                      shrinkWrap: true,
                      children: List.generate(100, (index) {
                        final isSeatBooked = seatStatusList[index];
                        Color seatColor = isSeatBooked ? Colors.red : Colors.green;

                        return Container(
                          margin: const EdgeInsets.all(2),
                          color: seatColor,
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
            ],
          ),
        ),
      ),
    );
  }
}
