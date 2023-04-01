import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:movielovers/home.dart';
import 'Auth/loginfirebaseauth.dart';



void  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp() );
}



//void main() => runApp(const SplashScreen());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
    @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie Lovers',
      home: MainPage(),
      
     
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

  
  
  //}
//}
