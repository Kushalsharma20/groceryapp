import 'package:flutter/material.dart';
import 'package:grocery_app/auth/sign_in.dart';
import 'package:grocery_app/auth/sign_up.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>(
      create: ((context) => ProductProvider()),
      child: MaterialApp(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          home: SignIn()),
    );
  }
}
