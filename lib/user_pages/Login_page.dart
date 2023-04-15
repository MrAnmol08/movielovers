// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movielovers/Admin/adminhome.dart';
import 'package:movielovers/user_pages/Register_page.dart';
import 'package:movielovers/user_pages/Forgot_Password.dart';
import 'package:movielovers/util/navbar.dart';
import 'package:movielovers/util/toast.dart';


// ignore: camel_case_types
class login extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const login({Key? key,required this.showRegisterPage}) : super(key: key);

  // final VoidCallback showRegisterPage;
  // const login({Key? key, required this.showRegisterPage}): super(key: key);

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {

 bool passwordObscured = true;

  //Text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  get error => null;

  Future signIn() async{

    
    try{
      //loading circle
    showDialog(
      context: context, 
      builder: (context){
        return Center(child: CircularProgressIndicator());
      },
      );
       await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
      );

      //check if user is an admin
      // if(_emailController.text.trim() == 'admin@gmail.com' && _passwordController.text.trim()=='admin'){
      //   //Navigate to the admin page
        
      //   Navigator.pushReplacement(context,
      //    MaterialPageRoute(builder: ((context) => AdminHome()),
      //    ),
      //    );
      // } else {
        
        Navigator.pushReplacement(
          context, MaterialPageRoute(
            builder: (context) => Navbar()),
            );
        //Display an erro message to the user
        utils().toastMessage('Successfully login');
     // }
    }
     on FirebaseAuthException catch(e) {
      if (e.code == 'User-not-found'){
        utils().toastMessage('Invalid user');
      } else if (e.code == 'wrong-password'){
        utils().toastMessage('Something went wrong');
      }
    }


    
   

      //Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      
      
      backgroundColor: Color.fromARGB(255, 251, 250, 250),
    
      body: SafeArea(
        
        
        child: Center(
            child: SingleChildScrollView(
              child: Column( 
                
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children:[
            
                  SizedBox(height: 5,),
                  Image.asset('assets/images/login.gif',
                  height: 200,
                  width: 200,),
                  const SizedBox(height: 40,),
            
                  //Email Address
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
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
                         prefixIcon: Icon(Icons.email,
                         color: Colors.grey,
                         ),
                      ),
                    ),
                  ),
                      
                  
                //Password
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      obscureText: passwordObscured,
                      controller: _passwordController,
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
                          color: Colors.grey,),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            
                            setState(() {
                              passwordObscured = !passwordObscured;
                              //Colors.black;
                            });
                          } ,
                          child: Icon(
                            passwordObscured ?
                            Icons.visibility_off : Icons.visibility,
                             color: Color.fromARGB(255, 140, 134, 134),
                             )), 
                      ),
                    
                    ), 
                  ),
            
                 //Forgot Password
                  const SizedBox(height: 3),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(onPressed: (){
                        Navigator.push(context,
                         MaterialPageRoute(builder:(context) => ForgotPassword()));
                      },
                        child: Text(
                          'Forgot Password?',
                          style:TextStyle(color: Color.fromARGB(255, 4, 136, 251),
                          fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  
                     
                  
                  //Sign In Button
                   const SizedBox(height: 8),
                  Padding(
                    
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: GestureDetector(
                      //  onTap: signIn ,
                      onTap: 
                        signIn,
                        // signIn(){
                        //   utils().toastMessage('Suceessflyy Login');
                        // }.onError((error, stackTrace){

                        // });
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 241, 24, 8),
                        borderRadius: BorderRadius.circular(12) ),
                        
                        child: const Center(
                          child: Text('Login',
                          style: TextStyle(color: Color.fromARGB(255, 247, 247, 247),
                          fontWeight:FontWeight.bold,
                          fontSize: 18, 
                          
                          )),
                        ),  
                      ),
                    ),
                  ),
                      
                 
                //Register Option
                const SizedBox(height: 15),
                      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        textAlign: TextAlign.end,
                         style:TextStyle(color:Color.fromARGB(255, 54, 63, 96),
                      fontWeight: FontWeight.bold
                      ),
                      ),

                      GestureDetector(
                        onTap: widget.showRegisterPage,
                        child: Text(
                          ' Register',
                          textAlign: TextAlign.end,
                           style:TextStyle(color:Color.fromARGB(255, 4, 136, 251),
                           fontWeight: FontWeight.bold
                           ),
                        ),
                      ),
                    ],
                  ),
                      
                ]
              ),
            ),
          ),
        ),
     // ) ,
      
    );
  }
}
