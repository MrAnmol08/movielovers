// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:movielovers/user_pages/Profilepage/change_password.dart';
import 'package:movielovers/user_pages/Profilepage/list.dart';


class Youpage extends StatefulWidget {
  const Youpage({super.key});

  @override
  State<Youpage> createState() => _YoupageState();
}

class _YoupageState extends State<Youpage> {
  final user = FirebaseAuth.instance.currentUser;
  String? userName;

  @override
  void initState() {
    super.initState();
    //getUserData();

    Future<void> getUserData() async {
      final firebaseUser = await FirebaseAuth.instance.currentUser!;
      setState(() {
        userName = firebaseUser.displayName;
      });
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(onPressed:(){}, icon:const  Icon(Ionicons.arrow_back_sharp), color:const Color.fromARGB(255, 54, 63, 96), ),
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
                )
              )
            ),
           ),
           ),
        
        title: Text('Profile',
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
                width: 80, height: 100,
                child: Image(image: AssetImage('assets/images/logofinal.png')),
              ),
              SizedBox(height: 10),
              Text(
                user?.displayName ?? ''),
              Text(
                user?.email ?? '',
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
                child: ElevatedButton(onPressed: (){},
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(const Color.fromARGB(255, 241, 24, 8),),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    
                    ),
                    ),
                
                 
                
                 child:  Text('Edit Profile',
                 style: GoogleFonts.openSans(
                   fontWeight: FontWeight.bold,
                   fontSize: 15,
                   color: Color.fromARGB(255, 247, 248, 249),
          ),
                 ),
                 ),
                ),
                SizedBox(height: 20),
               Padding( padding: const EdgeInsets.all(8.0), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Icon( Ionicons.settings_sharp, size: 20, color: Color.fromARGB(255, 92, 97, 118), ), SizedBox(width: 8), Text( 'Change Password', style: GoogleFonts.openSans( fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 54, 63, 96), ), ), SizedBox(width: 140), GestureDetector(onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()), ); }, child: Icon( Ionicons.chevron_forward_outline, size: 25, color: Color.fromARGB(255, 116, 119, 129), )), ] ), ),
               Divider(color: Colors.grey),
                Padding( padding: const EdgeInsets.all(8.0), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Icon( Ionicons.reader_outline, size: 20, color: Color.fromARGB(255, 92, 97, 118), ), SizedBox(width: 12), Text( 'Terms & Condition', style: GoogleFonts.openSans( fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 54, 63, 96), ), ), SizedBox(width: 140), Icon( Ionicons.chevron_forward_outline, size: 25, color: Color.fromARGB(255, 116, 119, 129), ), ] ), ),
               Divider(color: Colors.grey),
               Padding( padding: const EdgeInsets.all(8.0), child: Row( children: [ Icon( Ionicons.log_out_outline, size: 20, color: const Color.fromARGB(255, 166, 41, 41), ), SizedBox(width: 12), Text( 'Log Out', style: GoogleFonts.openSans( fontWeight: FontWeight.bold, fontSize: 17, color: Color.fromARGB(255, 54, 63, 96), ), ), SizedBox(width: 240), GestureDetector(onTap: (){  FirebaseAuth.instance.signOut();}, child: Icon( Ionicons.chevron_forward_outline, size: 25, color: Color.fromARGB(255, 116, 119, 129), )), ] ), ),
               

            ],
          ),
        ),
      ),
    );  }
}