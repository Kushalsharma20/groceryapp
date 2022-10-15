import 'package:flutter/material.dart';
import 'package:grocery_app/screens/admin/admin_home.dart';
import 'package:grocery_app/screens/home/home_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // admin button
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: ((context) => const AdminHome())),
                    (route) => true);
              },
              icon: Icon(Icons.admin_panel_settings),
              label: Text("ADMIN")),
          // user button
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: ((context) => HomeScreen())),
                    (route) => true);
              },
              icon: Icon(Icons.admin_panel_settings),
              label: Text("USER"))
        ],
      ),
    );
  }
}
