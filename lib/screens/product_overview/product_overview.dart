import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/controllers/cart_controller.dart';
import 'package:grocery_app/models/cart_model.dart';
import 'package:grocery_app/models/review_cart_model.dart';
import 'package:grocery_app/providers/wishlist_provider.dart';
import 'package:grocery_app/screens/review_cart/review_cart.dart';
import 'package:grocery_app/widgets/count.dart';
import 'package:provider/provider.dart';

import '../../providers/review_cart_provider.dart';

enum SinginCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  final int productQuantity;
  ProductOverview(
      {required this.productId,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity});

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SinginCharacter? _character = SinginCharacter.fill;

  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    required Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap as void Function()?,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool? wishListBool = false;

  getWishtListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(
                        () {
                          wishListBool = value.get("wishList");
                        },
                      ),
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    // WishListProvider wishListProvider = Provider.of(context);
    // getWishtListBool();
    ReviewCartProvider cartProvider = Provider.of(context);
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "Add To WishList",
              iconData: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              onTap: () {
                // setState(() {
                //   wishListBool = !wishListBool!;
                // });
                // if (wishListBool == true) {
                //   wishListProvider.addWishListData(
                //     wishListId: widget.productId,
                //     wishListImage: widget.productImage,
                //     wishListName: widget.productName,
                //     wishListPrice: widget.productPrice,
                //     wishListQuantity: 2,
                //   );
                // } else {
                //   wishListProvider.deleteWishtList(widget.productId);
                // }
              }),
          bonntonNavigatorBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.black45,
              title: "Go To Cart",
              iconData: Icons.shop_outlined,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
                // print("started to add");
                // cartProvider.addReviewCartData(
                //     context: context,
                //     cartId: widget.productId,
                //     cartName: widget.productImage,
                //     cartImage: widget.productImage,
                //     cartPrice: widget.productPrice,
                //     cartQuantity: widget.productQuantity,
                //     cartUnit: widget.productQuantity);
                // print("finished to add");
              }),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product Overview",
          style: TextStyle(color: textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.productName),
                      subtitle: Text(
                        widget.productPrice.toString(),
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    Container(
                        height: 250,
                        padding: EdgeInsets.all(40),
                        child: Image.network(
                          widget.productImage,
                        )),
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
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              ),
                              Radio(
                                value: SinginCharacter.fill,
                                groupValue: _character,
                                activeColor: Colors.green,
                                onChanged: (dynamic value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                              Text(
                                "${widget.productQuantity}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Text(
                            "\UGX ${widget.productPrice}",
                            style: TextStyle(color: Colors.black),
                          ),
                          Count(
                            productId: widget.productId,
                            productImage: widget.productImage,
                            productName: widget.productName,
                            productPrice: widget.productPrice,
                            productQuantity: widget.productQuantity,
                          ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //     horizontal: 30,
                          //     vertical: 10,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: Colors.grey,
                          //     ),
                          //     borderRadius: BorderRadius.circular(
                          //       30,
                          //     ),
                          //   ),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Icon(
                          //         Icons.add,
                          //         size: 17,
                          //         color: primaryColor,
                          //       ),
                          //       Text(
                          //         "ADD",
                          //         style: TextStyle(color: primaryColor),
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Text(
                      "About This Product",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "of a customer. Wikipedi In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer. Wikipedi",
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
