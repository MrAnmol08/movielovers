import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielovers/util/toast.dart';

import 'Login_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
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
          onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  login(showRegisterPage: () {  },)),
          ),
          
           
        ),
        title: const Text('Forgot Password',
        style: TextStyle(color: Color.fromARGB(255, 44, 54, 87),
        fontWeight: FontWeight.bold, fontSize: 21,
        ),
        ),
        

        
      ),

      resizeToAvoidBottomInset: false,
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 251, 250, 250),
      body: SingleChildScrollView(
        child:Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/password.gif',
                height: 200,
                width: 200,
                ),

                const SizedBox(height: 10),
                Text('Enter your Email to reset you password',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 18, color: const Color.fromARGB(255, 54, 63, 96),
                  ),
                  ),
                  const SizedBox(height: 10),
                   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: const Color.fromARGB(255, 253, 253, 253),
                      filled: true,
                       prefixIcon: const Icon(Icons.email,
                       color: Colors.grey,
                       ),
                    ),
                  ),
                ),
                const SizedBox(height: 13),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: GestureDetector(
                      onTap: (){
                        auth.sendPasswordResetEmail(email: _emailController.text.toString()).then((value){
                          utils().toastMessage('Please check your email for password recovery instructions',);
                          }).onError((error, stackTrace){
                            utils().toastMessage(error.toString());
                          } );

                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 241, 24, 8),
                        borderRadius: BorderRadius.circular(12) ),
                        
                        child: const Center(
                          child: Text('Submit',
                          style: TextStyle(color: Color.fromARGB(255, 247, 247, 247),
                          fontWeight:FontWeight.bold,
                          fontSize: 18, 
                          
                          )),
                        ),  
                      ),
                    ),
                  ),


          ],
        ),
         ),
      
      

      


    );
  }
}

//auth.sendPasswordResetEmail(email: email).then((value){
                        //   utils().toastMessage('Please check your email for password recovery instructions. ');
                        // }).onError((error, stackTrace) {
                        //   utils().toastMessage(error.toString());
                       // });