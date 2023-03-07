// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LandscapeScroll extends StatelessWidget {
  const LandscapeScroll({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            //Scroll movies
             width: 360,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage ('assets/images/avatar.jpg'),
                ),
                ),
            ),
    );
          
 
    
           

          
  }
}