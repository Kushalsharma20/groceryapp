import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/auth/sign_in.dart';
import 'package:grocery_app/auth/sign_up.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';
import 'package:grocery_app/screens/product_overview/product_overview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        theme: ThemeData(), debugShowCheckedModeBanner: false, home: SignIn());
=======
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
>>>>>>> f830f0bf4a93eef617356d8846f1d5d1095bc241
  }
}
