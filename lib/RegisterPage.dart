// ignore_for_file: unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielovers/Login.dart'; 

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _email, _phone, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
       backgroundColor:  Color.fromARGB(255, 253, 251, 251),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 112, 4, 4) ,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context,
          MaterialPageRoute(builder: (context) => const login()),),
        ),
        title: const Text('Create Account'),
      ),

      body: SafeArea(
        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:const [
                SizedBox(height: 20,),
              Text('Register', textAlign: TextAlign.center,
              style: 
              TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 20) ,),

                SizedBox(height: 20),

                
            ]
            

          )
        ),

      ),
  
      
      // body: Form(
      //   key: _formKey,
      //   child: Padding(
      //     padding: const EdgeInsets.all(12.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: const <Widget>[
      //         //const Text(
      //           //'Create Account',
      //           //style: TextStyle(
      //             //fontSize: 24.0,
      //             //fontWeight: FontWeight.bold,
      //           //),
      //         //),
              
      //       ],
            
      //     ),
      //   ),
      // ),

      
    );
  }

  // void _submit() {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState;
  //   }
  // }
}