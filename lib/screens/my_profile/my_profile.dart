import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/screens/home_screen/drawer_side.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget listTile({IconData? icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

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
                                backgroundColor: primarycolor,
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
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Delivery Address"),
                    listTile(
                        icon: Icons.person_outlined, title: "Refer To Friends"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions"),
                    listTile(
                        icon: Icons.policy_outlined, title: "privacy Policy"),
                    listTile(icon: Icons.add_chart, title: "About"),
                    listTile(
                        icon: Icons.exit_to_app_outlined, title: "Log Out"),
                  ]),
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
