// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
//import 'package:movielovers/RegisterPage.dart';


// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {

  //Text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      
      
      backgroundColor: Color.fromARGB(255, 251, 250, 250),
    
      body: SafeArea(
        
        
        child: Center(
          //child: SingleChildScrollView(
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
                       prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
          
                
          
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
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
                       prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),


               
                
                const SizedBox(height: 15),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Forgot Password?',
                        style:TextStyle(color: Color.fromARGB(255, 4, 136, 251),
                        fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                
                   
                
          
                 const SizedBox(height: 15),
                Padding(
                  
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 241, 24, 8),
                    borderRadius: BorderRadius.circular(12) ),
                    
                    child: const Center(
                      child: Text('Sign In',
                      style: TextStyle(color: Color.fromARGB(255, 247, 247, 247),
                      fontWeight:FontWeight.bold,
                      fontSize: 18, 
                      
                      )),
                    ),  
                  ),
                ),
          
               
          
              const SizedBox(height: 15),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Not a member?',textAlign: TextAlign.end, style:TextStyle(color:Color.fromARGB(255, 1, 4, 12),
                    fontWeight: FontWeight.bold, )), 
                    
                    Text(' Register', style:TextStyle(color:Color.fromARGB(255, 4, 136, 251),
                    fontWeight: FontWeight.bold ) ),
            //         InkWell(
            //           onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => const RegisterPage()),
            //   );
            // },
                      
                        
                      
          
            //         )
                  ],
                ),
          
              ]
            ),
          ),
        ),
     // ) ,
      
    );
  }
}
