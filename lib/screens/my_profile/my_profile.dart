import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/screens/home_screen/drawer_side.dart';

import '../home_screen/home_screen.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "My Profile",
            style: TextStyle(fontSize: 18, color: Colors.yellow),
          ),
        ),
        drawer: DrawerSide(),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  height: 470,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: ListView(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kushal",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textColor),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("kushal20.ks@gmail.com"),
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: primarycolor,
                                  ),
                                  backgroundColor: scaffoldBackgroundColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(
                    height: 1,
                  ),
                    ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text("My Delivery Address", textDirection: TextDirection.ltr),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  }),
                  Divider(
                    height: 1,
                  ),
                    ListTile(
                  leading: Icon(Icons.person_outlined),
                  title: Text("Refer to Friends", textDirection: TextDirection.ltr),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  }),
                  Divider(
                    height: 1,
                  ),
                    ListTile(
                  leading: Icon(Icons.file_copy_outlined),
                  title: Text("Terms & Conditions", textDirection: TextDirection.ltr),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  }),
                  Divider(
                    height: 1,
                  ),
                   ListTile(
                  leading: Icon(Icons.policy_outlined),
                  title: Text("Privacy Polcy", textDirection: TextDirection.ltr),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  }),
                  Divider(
                    height: 1,
                  ),
                    ListTile(
                  leading: Icon(Icons.add_chart),
                  title: Text("About", textDirection: TextDirection.ltr),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  }),
                  Divider(
                    height: 1,
                  ),
                   ListTile(
                  leading: Icon(Icons.exit_to_app_outlined),
                  title: Text("Log out", textDirection: TextDirection.ltr),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => HomeScreen()));
                  }),
                  Divider(
                    height: 1,
                  )
                  ]),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(""),
                  radius: 45,
                  backgroundColor: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
