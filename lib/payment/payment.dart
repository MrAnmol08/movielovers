import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:movielovers/util/navbar.dart';

void payWithKhalti(BuildContext context,int FinalAmount) {
    var pay = KhaltiScope.of(context ).pay(
      config: PaymentConfig(
        amount:FinalAmount * 10, //in paisa
        productIdentity: 'Product Id',
        productName: 'Product Name',
        mobileReadOnly: false,
      ),
      preferences: [
        PaymentPreference.khalti,
        
      ],
      onSuccess: (PaymentSuccessModel success){onSuccess(context);} ,
      onFailure:onFailure,
      onCancel: onCancel,
    );
  }

  void onSuccess(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(title: const Text('Payment Successful'),
      actions: [
        SimpleDialogOption(child: const Text('OK'),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Navbar()),
          );
        },
        ),
      ],
      );
    });
  }

  void onFailure(PaymentFailureModel failure){
    debugPrint(failure.toString());
  }

  void onCancel(){
    debugPrint("Cancelled");
  }

