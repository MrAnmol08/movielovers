
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movielovers/user_pages/Register_page.dart';
import 'package:movielovers/util/navbar.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? name = UserDetails.name;
  String? email = UserDetails.email;
  String? uid = UserDetails.uid;
  

  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _NameController.text = UserDetails.name ?? '';
    _emailController.text = UserDetails.email ?? '';
  }

  @override
  void dispose() {
    _NameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _handleSaveButtonPressed() async {
    final newName = _NameController.text.trim();
    try {
       if (_emailController.text.isNotEmpty &&
          _NameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty) {
        final name = _NameController.text;
        final email = _emailController.text;
        await DatabaseService(uid: UserDetails.uid)
            .updateUserData(name, email);
        Fluttertoast.showToast(
          msg: "Save change successfully",
          backgroundColor: Colors.green,
          fontSize: 16.0,
        );
      } else {
        Fluttertoast.showToast(
            msg: "Field cannot be empty",
            toastLength: Toast.LENGTH_SHORT,
            // gravity: ToastGravity.TOP,
            // backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.code,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print('****${e.code}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(1),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
              width: 1,
            ))),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 54, 63, 96),
          ),
          onPressed: () {
             Navigator.pop(context);
          }
          ),
          title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Color.fromARGB(255, 54, 63, 96),
            fontWeight: FontWeight.bold,
          ),
        ),
          //  MaterialPageRoute(builder: (context) =>  login(showRegisterPage: () {  },)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
            'assets/images/editprofile.gif',
            height: 200,
            width: 200,
          ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Edit your Name',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: const Color.fromARGB(255, 54, 63, 96),
                    ),
                  ),
                ),
              ],
              ),
              const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _NameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // hintText: 'FullName',
                  // fillColor: Color.fromARGB(255, 253, 253, 253),
                  // filled: true,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
           const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                enabled: false,
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                     _handleSaveButtonPressed();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 241, 24, 8),
                        borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text('Submit',
                          style: TextStyle(
                            color: Color.fromARGB(255, 247, 247, 247),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ),
              ),
                ],
              )
            
          ),
      )
      );
  }

  Widget buildTextField(String labelText, TextEditingController placeholder) {
    bool isEmailField = labelText.toLowerCase() == 'e-mail';
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: placeholder,
        enabled: !isEmailField,
        decoration: InputDecoration(
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
