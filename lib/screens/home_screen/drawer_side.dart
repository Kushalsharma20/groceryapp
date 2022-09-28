import 'package:flutter/material.dart';
import 'package:grocery_app/auth/sign_in.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';
import 'package:grocery_app/screens/my_profile/my_profile.dart';

class DrawerSide extends StatelessWidget {
  DrawerSelection _drawerSelection = DrawerSelection.home;
  Widget listTile({IconData? icon, String? title, required Function onTap}) {
    return ListTile(
      onTap: () {},
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
          color: Colors.yellow,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: scaffoldBackgroundColor,
                        radius: 43,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            "https://s3.envato.com/files/328957910/vegi_thumb.png",
                          ),
                        )),
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
              ListTile(
                  selected: _drawerSelection == DrawerSelection.home,
                  leading: Icon(Icons.home_outlined),
                  title: Text("Home", textDirection: TextDirection.ltr),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
              ListTile(
                  leading: Icon(Icons.shop_outlined),
                  title: Text("Review", textDirection: TextDirection.ltr),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                  }),
              ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text("My Profile", textDirection: TextDirection.ltr),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                  }),
              ListTile(
                  leading: Icon(Icons.notifications_outlined),
                  title: Text("Notification", textDirection: TextDirection.ltr),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                  }),
              ListTile(
                  leading: Icon(Icons.star_outline),
                  title:
                      Text("Rating & Review", textDirection: TextDirection.ltr),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                  }),
              ListTile(
                  leading: Icon(Icons.favorite_outlined),
                  title: Text("Wishlist", textDirection: TextDirection.ltr),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                  }),
              ListTile(
                  leading: Icon(Icons.copy_outlined),
                  title: Text("Raise A Complaint",
                      textDirection: TextDirection.ltr),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                  }),
              ListTile(
                  leading: Icon(Icons.format_quote_rounded),
                  title: Text("FAQ's", textDirection: TextDirection.ltr),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyProfile()));
                  }),
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

enum DrawerSelection { home }
