import 'package:flutter/material.dart';
import 'package:grocery_app/screens/home_screen/drawer_side.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),
    );
  }
}
