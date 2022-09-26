import 'package:flutter/material.dart';
import 'package:grocery_app/auth/sign_in.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/screens/my_profile/my_profile.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile({IconData? icon, String? title, required Function onTap}) {
    return ListTile(
      onTap: () => MyProfile(),
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(color: textColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.green,
        child: Container(
          width: 100,
          color: Colors.green,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: scaffoldBackgroundColor,
                        radius: 43,
                        child: CircleAvatar(
                            radius: 40, backgroundColor: Colors.transparent)),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("welcome back"),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 30,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                              );
                            },
                            child: Text(
                              "Login",
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              listTile(icon: Icons.home_outlined, title: "Home", onTap: () {}),
              listTile(
                  icon: Icons.shop_outlined,
                  title: "Review Cart",
                  onTap: () {}),
              listTile(
                  icon: Icons.person_outline,
                  title: "My Profile",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MyProfile()));
                  }),
              listTile(
                  icon: Icons.notifications_outlined,
                  title: "Notification",
                  onTap: () {}),
              listTile(
                  icon: Icons.star_outline,
                  title: "Rating & Review",
                  onTap: () {}),
              listTile(
                  icon: Icons.favorite_outlined,
                  title: "Wishlist",
                  onTap: () {}),
              listTile(
                  icon: Icons.copy_outlined,
                  title: "Raise A Complaint",
                  onTap: () {}),
              listTile(
                  icon: Icons.format_quote_rounded,
                  title: "FAQ's",
                  onTap: () {}),
              Container(
                height: 350,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Support"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Call:"),
                        SizedBox(
                          width: 30,
                        ),
                        Text("0788968995"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text("Mail Us:"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("kushal20.ks@gmail.com"),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
