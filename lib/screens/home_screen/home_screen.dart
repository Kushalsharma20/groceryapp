import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  Widget singalProducts() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 160,
        height: 230,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Expanded(
              child: Image.network(
                  "https://www.veggycation.com.au/siteassets/veggycationvegetable/basil.jpg")),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fresh Basil",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "1000/=/100g",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 5),
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "100 Gram",
                                  style: TextStyle(fontSize: 10),
                                )),
                                Center(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Colors.yellow,
                                  ),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //+ or -
                            Icon(Icons.remove,
                                size: 15, color: Color(0xffdd0b84c)),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Color(0xffdd0b84c),
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xffdd0b84c),
                            ),
                          ],
                        ),
                      )),
                    ])
                  ]),
            ),
          )
        ]));
  }

  Widget listTile({IconData? icon, String? title}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffcbcbcb),
        drawer: Drawer(
          child: Container(
            color: Color(0xffd1ad17),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white54,
                        radius: 43,
                        child: CircleAvatar(
                            radius: 40, backgroundColor: Colors.yellow),
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
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            CircleAvatar(
                radius: 12,
                backgroundColor: Color.fromARGB(167, 31, 167, 230),
                child: Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color.fromARGB(255, 56, 214, 64),
                  child: Icon(
                    Icons.shop,
                    size: 18,
                    color: Colors.black,
                  ),
                )),
          ],
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          backgroundColor: Color(0xffd6b738),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://cdn-2.tstatic.net/travel/foto/bank/images/blueberry_20160901_120145.jpg')),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Herbs Seasonings'),
                    Text(
                      'View All',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      singalProducts(),
                      singalProducts(),
                      singalProducts(),
                      singalProducts(),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fresh Fruits'),
                    Text(
                      'View All',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      singalProducts(),
                      singalProducts(),
                      singalProducts(),
                      singalProducts(),
                    ],
                  )),
            ])));
  }
}
