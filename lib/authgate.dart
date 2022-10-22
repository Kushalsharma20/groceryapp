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
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
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
      ),
    );
  }
}
