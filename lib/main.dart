import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/auth/sign_in.dart';
import 'package:grocery_app/auth/sign_up.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';
import 'package:grocery_app/screens/product_overview/product_overview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
