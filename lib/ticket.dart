import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ticket extends StatefulWidget {
  const ticket({super.key});

  @override
  State<ticket> createState() => _ticketState();
}

class _ticketState extends State<ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Ticket'),
      ),
      body: Center(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
               MaterialButton(onPressed: ()
                {
                FirebaseAuth.instance.signOut();
               },
               color: const Color.fromARGB(255, 241, 24, 8),
               child: const Text('Logout'),
               ),
              
          ],
        


        ),
      ),
      
    );
  }
}