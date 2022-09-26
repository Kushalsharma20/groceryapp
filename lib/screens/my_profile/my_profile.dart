import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/screens/home_screen/drawer_side.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primarycolor,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 18, color: primarycolor),
          ),
        ),
        drawer: DrawerSide(),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  color: primarycolor,
                ),
                Container(
                  height: 548,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: primarycolor,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(""),
                  radius: 45,
                  backgroundColor: scaffoldBackgroundColor,
                ),
              ),
            )
          ],
        ));
  }
}
