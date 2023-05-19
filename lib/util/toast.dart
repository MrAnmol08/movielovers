import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils{


  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 209, 203, 202),
        textColor: const Color.fromARGB(255, 38, 50, 82),
        fontSize: 16.0
    );
  }

}