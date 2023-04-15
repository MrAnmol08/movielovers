// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class DeleteAccountPage extends StatefulWidget {
//   @override
//   _DeleteAccountPageState createState() => _DeleteAccountPageState();
// }

// class _DeleteAccountPageState extends State<DeleteAccountPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
  

//   Future<void> _deleteAccount() async {
//     try {
//       User? user = _auth.currentUser;
//       await user?.delete();
//       Navigator.of(context).pop();
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   void _showDeleteAccountDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Are you sure you want to delete your account?'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Delete'),
//               onPressed: () {
//                 _deleteAccount();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Delete Account'),
//       // ),
//       // body: Column(
//       //   children: <Widget>[
//       //     SizedBox(height: 20),
//       //     Text(
//       //       'Warning: This will permanently delete your account.',
//       //       style: TextStyle(
//       //         color: Colors.red,
//       //         fontWeight: FontWeight.bold,
//       //       ),
//       //     ),
//       //     SizedBox(height: 20),
//       //     ElevatedButton(
//       //       child: Text('Delete Account'),
//       //       onPressed: _showDeleteAccountDialog,
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
