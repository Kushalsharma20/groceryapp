import "package:flutter/material.dart";
import 'package:grocery_app/config/colors.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  const ProductOverview({
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  State<ProductOverview> createState() => _ProductOverview();
}

class _ProductOverview extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: [
            bonntonNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Add TO Wishlist",
              iconData: Icons.favorite_outline,
            ),
            bonntonNavigatorBar(
              backgroundColor: primarycolor,
              color: textColor,
              iconColor: Colors.white70,
              title: "GoTo Cart",
              iconData: Icons.shop_outlined,
            ),
          ],
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          title: Text(
            "Product Overview",
            style: TextStyle(color: textColor),
          ),
        ),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Container(
                width: double.infinity,
                child: Column(children: [
                  ListTile(
                    title: Text("Fresh Basil"),
                    subtitle: Text("UGX 1000"),
                  ),
                  Container(
                      height: 150,
                      padding: EdgeInsets.all(0),
                      child: Image.network(
                          "https://www.veggycation.com.au/siteassets/veggycationvegetable/basil.jpg")),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green,
                            ),
                            Radio(
                                value: SigninCharacter.fill,
                                groupValue: _character,
                                activeColor: Colors.green,
                                onChanged: (value) {
                                  setState(() {
                                    _character = value!;
                                  });
                                })
                          ]),
                          Text("\UGX${widget.productPrice}"),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                  30,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 15,
                                  color: primarycolor,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                    color: primarycolor,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                ])),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About this Product",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Basil, also called great basil, is a culinary herb of the family Lamiaceae. It is a tender plant, and is used in cuisines worldwide.",
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ],
                )),
          )
        ]));
  }
}
