// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:movielovers/product_item/cart.dart';
import 'package:provider/provider.dart';
import 'Auth/loginfirebaseauth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//void main() => runApp(const SplashScreen());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => cart(),
      child: KhaltiScope(
          publicKey: "test_public_key_a451336c859c4556b36ce906655d96a2",
          builder: (context, navKey) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Movie Lovers',
              home: MainPage(),
              navigatorKey: navKey,
              localizationsDelegates: const [
                KhaltiLocalizations.delegate
              ],
            );
          }),
    );
  }
}
