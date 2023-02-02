import 'package:flutter/material.dart';


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
      
      backgroundColor: Colors.white,
    
      body: SafeArea(
        
        child: Center(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children:[
              SizedBox(height: 20,),
            Text('Welcome',
            style: 
            TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 36) ,),

              SizedBox(height: 60,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                   color: (Colors.grey[200]),
                   border: Border.all(color: Color.fromARGB(255, 247, 247, 247)),
                   borderRadius: BorderRadius.circular(15),
                  ) ,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                     
                      decoration: InputDecoration(
                        border: InputBorder.none, 
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                   color: (Colors.grey[200]),
                   border: Border.all(color: Color.fromARGB(255, 247, 247, 247)),
                   borderRadius: BorderRadius.circular(15),
                  ) ,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                     
                      decoration: InputDecoration(
                        border: InputBorder.none, 
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),

            
              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Color.fromARGB(255, 241, 24, 8),
                  borderRadius: BorderRadius.circular(12) ),
                  child: Center(
                    child: Text('Sign In',
                    style: TextStyle(color: Color.fromARGB(255, 247, 247, 247),
                    fontWeight:FontWeight.bold,
                    fontSize: 18,
                    )),
                  ),  
                ),
              ),

            SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Not a member?', style:TextStyle(color:Color.fromARGB(255, 1, 4, 12),
                  fontWeight: FontWeight.bold )),
                  
                  Text(' Register', style:TextStyle(color:Color.fromARGB(255, 6, 64, 240),
                  fontWeight: FontWeight.bold ) ,),
                ],
              ),

            ]
          ),
        ),
      ) ,
      
    );
  }
}