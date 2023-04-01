// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielovers/user_pages/Profilepage/you-page.dart';
import 'package:movielovers/util/navbar.dart';
import 'package:movielovers/util/toast.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final auth = FirebaseAuth.instance;
  final User = FirebaseAuth.instance.currentUser;
  bool passwordObscured = true;
  final _oldpasswordController = TextEditingController();
  final _newpasswordController = TextEditingController();

  passwordchange(email,oldPassword,newPassword) async {
    var cred = EmailAuthProvider.credential(email: email, password: oldPassword);
    await User!.reauthenticateWithCredential(cred).then((value) {
      User!.updatePassword(newPassword);
    }).catchError((error){
      print(error.toString());

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
            ))),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Color.fromARGB(255, 44, 54, 87),
          ),
          onPressed: () {
            Navigator.pop(context);
          } 
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: Color.fromARGB(255, 44, 54, 87),
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
      ),

      resizeToAvoidBottomInset: false,
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromARGB(255, 251, 250, 250),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/password.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Create new password',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 54, 63, 96),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Your new password must be different from previous one',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 107, 112, 127),
                ),
              ),
            ),
                        
// This section is for Old password
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: passwordObscured,
                controller: _oldpasswordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: ' Old Password',
                  fillColor: Color.fromARGB(255, 253, 253, 253),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          passwordObscured = !passwordObscured;
                        });
                      },
                      child: Icon(
                        passwordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      )),
                ),
              ),
            ),

           // This section is for New password
             const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: passwordObscured,
                controller: _newpasswordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: ' New Password',
                  fillColor: Color.fromARGB(255, 253, 253, 253),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          passwordObscured = !passwordObscured;
                        });
                      },
                      child: Icon(
                        passwordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
//             SizedBox(height: 15),

// // This section is for confirm password
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextField(
//                 obscureText: passwordObscured,
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   hintText: ' Confirm Password',
//                   fillColor: Color.fromARGB(255, 253, 253, 253),
//                   filled: true,
//                   prefixIcon: Icon(
//                     Icons.lock,
//                     color: Colors.grey,
//                   ),
//                   suffixIcon: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           passwordObscured = !passwordObscured;
//                         });
//                       },
//                       child: Icon(
//                         passwordObscured
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                         color: Colors.grey,
//                         //color: Colors.grey,
//                       )),
//                 ),
//               ),
//             ),

            SizedBox(height: 13),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GestureDetector(
                onTap: (){
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 24, 8),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text('Submit',
                        style: TextStyle(
                          color: Color.fromARGB(255, 247, 247, 247),
                          fontWeight: FontWeight.bold,
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