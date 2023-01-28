// ignore_for_file: unused_field, deprecated_member_use

import 'package:flutter/cupertino.dart';
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
                    child: Text('Login', style: GoogleFonts.khand(fontSize: 25, fontWeight: FontWeight.bold , color: Colors.white )),
                     
                  ),
                ),
                const SizedBox(height: 10.0,),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      // Navigate to forgot password page
                    },
                    child: Text('Forgot Password',
                     style: GoogleFonts.khand(color: const Color.fromARGB(255, 73, 69, 69)),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
