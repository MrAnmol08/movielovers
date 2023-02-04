// ignore_for_file: unused_field, deprecated_member_use, prefer_const_constructors

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
            children: [
                SizedBox(height: 20,),
              Text('Register', textAlign: TextAlign.center,
              style: 
              TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 20) ,),

                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (Colors.grey[200]),
                       border: Border.all(color: const Color.fromARGB(255, 247, 247, 247)),
                        borderRadius: BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                       keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none, 
                          hintText: 'Full Name',
                        ),
                          
                      ),
                    ),
                  )
                ),
               
               SizedBox(height: 15),

               Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (Colors.grey[200]),
                       border: Border.all(color: const Color.fromARGB(255, 247, 247, 247)),
                        borderRadius: BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                       keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none, 
                          hintText: 'Email',
                        ),
                          
                      ),
                    ),
                  )
                ),

                SizedBox(height: 15),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (Colors.grey[200]),
                       border: Border.all(color: const Color.fromARGB(255, 247, 247, 247)),
                        borderRadius: BorderRadius.circular(15),
                    ),

                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                       keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          border: InputBorder.none, 
                          hintText: 'Phone Number',
                        ),
                          
                      ),
                    ),
                  )
                ),





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