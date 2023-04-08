import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void payWithKhalti(BuildContext context) {
    var pay = KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 1000, //in paisa
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
      return AlertDialog(title: Text('Payment Successful'),
      actions: [
        SimpleDialogOption(child: const Text('OK'),
        onPressed: (){
          Navigator.pop(context);
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

