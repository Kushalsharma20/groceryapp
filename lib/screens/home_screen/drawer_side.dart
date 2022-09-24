import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile({IconData? icon, String? title}) {
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
        backgroundColor: primarycolor,
        child: Container(
          width: 100,
          color: primarycolor,
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: scaffoldBackgroundColor,
                      radius: 43,
                      child: CircleAvatar(
                          radius: 40, backgroundColor: primarycolor),
                    ),
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
                            onPressed: () {},
                            child: Text(
                              "Login",
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              listTile(icon: Icons.home_outlined, title: "Home"),
              listTile(icon: Icons.shop_outlined, title: "Review Cart"),
              listTile(icon: Icons.person_outline, title: "My Profile"),
              listTile(
                  icon: Icons.notifications_outlined, title: "Notification"),
              listTile(icon: Icons.star_outline, title: "Rating & Review"),
              listTile(icon: Icons.favorite_outlined, title: "Wishlist"),
              listTile(icon: Icons.copy_outlined, title: "Raise A Complaint"),
              listTile(icon: Icons.format_quote_rounded, title: "FAQ's"),
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
