import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Movielist extends StatelessWidget {
  final imagepath;
  final buttonText;

  const Movielist({
    Key?key,
    required this.imagepath,
    required this.buttonText,

  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                               color: Colors.grey,
                               borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Image.asset(
                                  imagepath,
                                  fit: BoxFit.cover,
                               
                                ),
                              ),
                            ),
                            const SizedBox(
                              height:10),
                        Text(
                          buttonText,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                          

                        
                        )
                          ],
    );
  }
}