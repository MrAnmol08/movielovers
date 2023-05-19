// ignore_for_file: unused_field, deprecated_member_use, prefer_const_constructors, must_call_super

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movielovers/user_pages/Login_page.dart';
import 'package:movielovers/util/navbar.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showloginpage;
  const RegisterPage({Key? key, required this.showloginpage}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  bool passwordObscured = true;
  bool confirmpasswordObscured = true;

  final _formKey = GlobalKey<FormState>();
  // String fullname = " ";
  // String email = "";
  // String password = "";
  
  //AuthService authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 8) {
    return 'Password should be at least 8 characters';
  }
  return null;
}

  Future registerUserwithEmailandPassword(String name, String email) async {
    try {
      showDialog(
        context: context,
        builder: (context){
          return Center(child: CircularProgressIndicator());
        },
        );
      User user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text))
          .user!;
          // Send verification email
      //  
      await DatabaseService(uid: user.uid).
      updateUserData(_nameController.text, _emailController.text)
      .then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => const Navbar())));
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return e;
    }
  }
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 251, 250, 250),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(1),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4),
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
            color: Color.fromARGB(255, 54, 63, 96),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => login(
                      showRegisterPage: () {},
                    )),
          ),
          //  MaterialPageRoute(builder: (context) =>  login(showRegisterPage: () {  },)),
        ),
        title: const Text(
          'Create Account',
          style: TextStyle(
            color: Color.fromARGB(255, 54, 63, 96),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/register.gif',
              height: 200,
              width: 200,
            ),

            Text(
              'Register below with your details',
              style: TextStyle(
                color: Color.fromARGB(255, 54, 63, 96),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // Text('Register', textAlign: TextAlign.center,
            // style:
            // TextStyle(
            //   fontWeight:FontWeight.bold,
            //   fontSize: 20) ,),

            // Name section in register page

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'FullName',
                  fillColor: Color.fromARGB(255, 253, 253, 253),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            // Email section in register page

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                 keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Email',
                  fillColor: Color.fromARGB(255, 253, 253, 253),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            

            // Password section in register page

            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: passwordObscured,
                controller: _passwordController,
               // validator: passwordValidator,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Password',
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
                        //color: Colors.grey,
                      )),
                ),
              ),
            ),

            // Confirm Password section in register page

            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                obscureText: confirmpasswordObscured,
                controller: _confirmpasswordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: ' Confirm Password',
                  fillColor: Color.fromARGB(255, 253, 253, 253),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          confirmpasswordObscured = !confirmpasswordObscured;
                        });
                      },
                      child: Icon(
                        confirmpasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      )),
                ),
              ),
            ),

            // Sign Up section on register page

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GestureDetector(
                onTap: () {
                  registerUserwithEmailandPassword(_nameController.text,
                      _emailController.text);
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 24, 8),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text('Sign Up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 247, 247, 247),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I am a member!',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 4, 12),
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: widget.showloginpage,
                  child: Text(
                    ' Login now',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 136, 251),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ]),
        )),
      ),
    );
  }
}
class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference user = FirebaseFirestore.instance.collection('users');
  Future updateUserData(String name, String email)
   async {
    if (uid != null && uid!.isNotEmpty) {
    return await user.doc(uid).set({
      "uid": uid,
      "name": name,
      "email": email,
    });
  } else {
    throw Exception("Invalid UID");
  }
  }
  
}