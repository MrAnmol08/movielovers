// ignore_for_file: unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50.0),
                 
                 const Text(
                  'Login',
                  textAlign:TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    
                    
                    
                    
                    
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                style: GoogleFonts.khand(color: const Color.fromARGB(255, 73, 69, 69)),
                  validator: (input) => !input!.contains('@') ? 'Please enter a valid email' : null,
                  onSaved: (input) => _email = input!,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                  style: GoogleFonts.khand(color: const Color.fromARGB(255, 73, 69, 69)),
                  validator: (input) => input!.length < 8 ? 'Your password needs to be at least 8 characters' : null,
                  obscureText: true,
                  onSaved: (input) => _password = input!,
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: const Color.fromARGB(247, 241, 4, 4),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Perform login here
                      }
                    },
                    child: Text('Login', 
                    style: GoogleFonts.khand(fontSize: 25, fontWeight: FontWeight.bold , color: Colors.white )),
                     
                  ),
                ),
                
          //       const SizedBox(height: 10.0,), // Navigate to forgot password page
          //       SizedBox(
          //         width: double.infinity,
          //         child: FlatButton(
          //           onPressed: () {
          //             //Navigator.pushNamed(context, '/forgot-password'); 
          //             Navigator.of(context).pop();
          //           },
          //           child: Text('Forgot Password',
          //            style: GoogleFonts.khand(color: const Color.fromARGB(3, 10, 221, 245)),),
          //         ),
          //       ),

                
          //       Widget build(BuildContext context) {
          //        return Scaffold(
          //        // existing code
          //         child: Column(
          //          children: <Widget>[
          // // existing code
          //           SizedBox(
          //             width: double.infinity,
          //               child: FlatButton(
          //                 onPressed: _showForgotPasswordDialog,
          //                   child: Text('Forgot Password',
          //                     style: GoogleFonts.khand(color: const Color.fromARGB(3, 10, 221, 245)),),

          //class _LoginPageState extends State<LoginPage> {
  // existing code

  void _showForgotPasswordDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Forgot Password'),
            content: TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                // Save the entered email value in a variable
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Submit'),
                onPressed: () {
                  // Send reset password link to the email entered
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // existing code
      child: Column(
        children: <Widget>[
          // existing code
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              onPressed: _showForgotPasswordDialog,
              child: Text('Forgot Password',
                style: GoogleFonts.khand(color: const Color.fromARGB(3, 10, 221, 245)),),
            ),
          ),
        ],
      ),
    );
  }
}

            ),
          ),
        ],
      ),
    );
  }
}

                
                
                
         
