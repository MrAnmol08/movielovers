// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movielovers/RegisterPage.dart';


// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      
      
      backgroundColor: Colors.white,
    
      body: SafeArea(
        
        
        child: Center(
          child: SingleChildScrollView(
            child: Column( 
              
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children:[
                const SizedBox(height: 20,),
              const Text('Welcome', textAlign: TextAlign.center,
              style: 
              TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 36) ,),
          
                const SizedBox(height: 40,),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                     color: (Colors.grey[200]),
                     border: Border.all(color: const Color.fromARGB(255, 247, 247, 247)),
                     borderRadius: BorderRadius.circular(15),
                    ) ,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                       
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: InputBorder.none, 
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
          
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                     color: (Colors.grey[200]),
                     border: Border.all(color: const Color.fromARGB(255, 247, 247, 247)),
                     borderRadius: BorderRadius.circular(15),
                    ) ,
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                       
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: InputBorder.none, 
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
               
               
              
                const SizedBox(height: 15),
                
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: const [
            
                    Text('                                                                    Forgot password?', style: TextStyle(color:Color.fromARGB(255, 1, 4, 12), fontWeight: FontWeight.bold,),textAlign:TextAlign.right ,)
          
                   ],
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
          
               
          
              const SizedBox(height: 10),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Not a member?',textAlign: TextAlign.end, style:TextStyle(color:Color.fromARGB(255, 1, 4, 12),
                    fontWeight: FontWeight.bold, )), 
                    
                    Text(' Register', style:TextStyle(color:Color.fromARGB(255, 6, 64, 240),
                    fontWeight: FontWeight.bold ) ,),
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
      ) ,
      
    );
  }
}