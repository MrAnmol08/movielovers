import 'package:flutter/material.dart';

class CustomTextFieldTile extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final IconData icon;

   CustomTextFieldTile({super.key, 
    required this.hintText,
    required this.icon,
    required this.controller,
     required this.keyboardType,
  });


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SizedBox(
        width: 250.0,
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
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Colors.grey,
                    ),
                    child: Icon(
                      icon,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  // SizedBox(width: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

