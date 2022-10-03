import 'package:flutter/material.dart';
import 'package:grocery_app/auth/sign_in.dart';
import 'package:grocery_app/auth/sign_up.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "VEGI",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: (context) => ProductProvider(),
      child: MaterialApp(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    );
  }
}
