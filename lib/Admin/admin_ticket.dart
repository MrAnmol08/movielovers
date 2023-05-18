import 'package:flutter/material.dart';

class AdminTicketPage extends StatefulWidget {
  @override
  _AdminTicketPageState createState() => _AdminTicketPageState();
}

class _AdminTicketPageState extends State<AdminTicketPage> {
  List<bool> _seatStatus = List.generate(100, (index) => false);

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
                )
              )
            ),
           ),
           ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
          size: 30,
          color: Color.fromARGB(255, 44, 54, 87),
          ),
          onPressed: () => Navigator.pop(context),
           
        ),
        title: const Text('Movie Ticket',
        style: TextStyle(color: Color.fromARGB(255, 44, 54, 87),
        fontWeight: FontWeight.bold, fontSize: 21,
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
                'Seats Overview:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 10,
                shrinkWrap: true,
                children: List.generate(100, (index) {
                  return SeatItem(
                    seatNumber: index + 1,
                    isSelected: _seatStatus[index],
                  );
                }),
              ),
              const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 24, 8),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text('Restart',
                            style: TextStyle(
                              color: Color.fromARGB(255, 247, 247, 247),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeatItem extends StatelessWidget {
  final int seatNumber;
  final bool isSelected;

  const SeatItem({
    required this.seatNumber,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      color: isSelected ? Colors.red : Colors.green,
      child: Center(
        child: Text(
          '$seatNumber',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        
      ),
      
    );
    
  }
}
