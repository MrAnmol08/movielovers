// import 'package:flutter/material.dart';
// import 'package:khalti_flutter/khalti_flutter.dart';
// import 'package:movielovers/util/navbar.dart';

// void payWithKhalti(BuildContext context,int FinalAmount) {
//     var pay = KhaltiScope.of(context ).pay(
//       config: PaymentConfig(
//         amount:FinalAmount * 10, //in paisa
//         productIdentity: 'Product Id',
//         productName: 'Product Name',
//         mobileReadOnly: false,
//       ),
//       preferences: [
//         PaymentPreference.khalti,
        
//       ],
//       onSuccess: (PaymentSuccessModel success){onSuccess(context);} ,
//       onFailure:onFailure,
//       onCancel: onCancel,
//     );
//   }

//   void onSuccess(BuildContext context) async{
    
//     showDialog(context: context, builder: (context){
//       return AlertDialog(title: const Text('Payment Successful'),
//       actions: [
//         SimpleDialogOption(child: const Text('OK'),
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context) => const Navbar()),
//           );
//         },
//         ),
//       ],
//       );
//     });
//   }

//   void onFailure(PaymentFailureModel failure){
//     debugPrint(failure.toString());
//   }

//   void onCancel(){
//     debugPrint("Cancelled");
//   }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:movielovers/util/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void payWithKhalti(BuildContext context, int finalAmount, String PhoneNumber, String Location, 
// String itemname, String itemsize
) {
  var pay = KhaltiScope.of(context).pay(
    config: PaymentConfig(
      amount: finalAmount * 10, //in paisa
      productIdentity: 'Product Id',
      productName: 'product name',
      
      
      mobileReadOnly: false,
    ),
    preferences: [
      PaymentPreference.khalti,
    ],
    onSuccess: (PaymentSuccessModel success) {
      onSuccess(context, success, PhoneNumber, Location
      // itemname, itemsize
      );
    },
    onFailure: onFailure,
    onCancel: onCancel,
  );
}

void onSuccess(BuildContext context, PaymentSuccessModel success, String PhoneNumber, String Location,
 //String itemname, String itemsize
 ) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    // User not authenticated, handle accordingly
    return;
  }

  final orderDetail = {
    'amount': success.amount,
    'productName': success.productName,
    'productIdentity': success.productIdentity,
    'phoneNumber': PhoneNumber,
    'location': Location,
    // 'itemname': itemname,
    // 'itemsize': itemsize,
    
    // Add more relevant fields as needed
  };

  try {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(user.uid)
        .set(orderDetail);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          actions: [
            SimpleDialogOption(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Navbar()),
                );
              },
            ),
          ],
        );
      },
    );
  } catch (error) {
    debugPrint('Failed to save payment data: $error');
  }
}

void onFailure(PaymentFailureModel failure) {
  debugPrint(failure.toString());
}

void onCancel() {
  debugPrint('Cancelled');
}

