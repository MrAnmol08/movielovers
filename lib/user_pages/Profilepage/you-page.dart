// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/Auth/auth_page.dart';
import 'package:movielovers/user_pages/Profilepage/EditProfile/editprofile.dart';
// import 'package:movielovers/Auth/database_service.dart';
// import 'package:movielovers/product_item/UserDetail.dart';
// import 'package:movielovers/user_pages/Login_page.dart';
import 'package:movielovers/user_pages/Profilepage/change_password.dart';
import 'package:movielovers/user_pages/Profilepage/list.dart';
import 'package:movielovers/user_pages/Profilepage/terms.dart';
import 'package:movielovers/util/navbar.dart';

import '../../Admin/UserDelete/deleteaccount.dart';

class Youpage extends StatefulWidget {
  const Youpage({super.key});

  @override
  State<Youpage> createState() => _YoupageState();
}

class _YoupageState extends State<Youpage> {
  final user = FirebaseAuth.instance.currentUser!;
  
  String _uid = "";
  String _name = "";

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  void getdata() async {
    _uid = user.uid;

    final DocumentSnapshot userDoc =
     await FirebaseFirestore.instance.collection('users').doc(_uid).get();
     setState(() {
       _name = userDoc.get('name');
     });
  }

  // Future<void> _deleteAccount() async {
  //   try {
  //     // User? user = FirebaseAuth.instance.currentUser!.currentUser;
  //     User? user = _auth.currentUser;
  //     await user?.delete();
  //     Navigator.of(context).pop();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // void _showDeleteAccountDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Are you sure you want to delete your account?'),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: Text('Delete'),
  //             onPressed: () {
  //               _deleteAccount();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  // String? name = Userdetails6.name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Ionicons.arrow_back_sharp),
        //   color: const Color.fromARGB(255, 54, 63, 96),
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          // ignore: prefer_const_constructors
          preferredSize: Size.fromHeight(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1,
            ))),
          ),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                width: 80,
                height: 100,
                child: Image(image: AssetImage('assets/images/logofinal.png')),
              ),
              SizedBox(height: 10),
              Text(_name,
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 54, 63, 96),
                ),
              ),
              Text(
                user.email ?? '',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 54, 63, 96),
                ),
              ),
              const SizedBox(height: 2),
              const Divider(color: Colors.white),
              const SizedBox(height: 2),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 241, 24, 8),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()),
                              );
                    },
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 247, 248, 249),
                      ),
                    ),
                  ),
                ),
              ),
              Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangePassword()),
                              );
                            },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Ionicons.settings_sharp,
                          size: 20,
                          color: Color.fromARGB(255, 92, 97, 118),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Change Password',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 54, 63, 96),
                          ),
                        ),
                        SizedBox(width: 140),
                        // GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => ChangePassword()),
                        //       );
                        //     },
                             Icon(
                              Ionicons.chevron_forward_outline,
                              size: 25,
                              color: Color.fromARGB(255, 116, 119, 129),
                            ),
                      ]),
                ),
              ),

             Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Ionicons.settings_sharp,
                        size: 20,
                        color: Color.fromARGB(255, 92, 97, 118),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Delete Account',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 54, 63, 96),
                        ),
                      ),
                      SizedBox(width: 140),
                      GestureDetector(
                          onTap: () {
                           // DeleteAccountPage();
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => DeleteAccountPage()),
                            // );
                          },
                           child: Icon(
                            Ionicons.chevron_forward_outline,
                            size: 25,
                            color: Color.fromARGB(255, 116, 119, 129),
                          )
                           ),
                    ]),
              ),

              Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Ionicons.reader_outline,
                        size: 20,
                        color: Color.fromARGB(255, 92, 97, 118),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Terms & Condition',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 54, 63, 96),
                        ),
                      ),
                      SizedBox(width: 140),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Term()),
                            );
                          },
                          child: Icon(
                            Ionicons.chevron_forward_outline,
                            size: 25,
                            color: Color.fromARGB(255, 116, 119, 129),
                          )),
                    ]),
              ),
              Divider(color: Colors.grey),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) => 
                  Navigator.push(context, MaterialPageRoute(builder: 
                  (context) {
                    return AuthPage();
                    
                  })));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Icon(
                      Ionicons.log_out_outline,
                      size: 20,
                      color: const Color.fromARGB(255, 166, 41, 41),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Log Out',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromARGB(255, 54, 63, 96),
                      ),
                    ),
                    SizedBox(width: 240),
                    Icon(
                      Ionicons.chevron_forward_outline,
                      size: 25,
                      color: Color.fromARGB(255, 116, 119, 129),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
