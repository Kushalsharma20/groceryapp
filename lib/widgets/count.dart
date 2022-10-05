import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  String productQuantity;
  int productPrice;

  Count(
      {required this.productName,
      required this.productImage,
      required this.productId,
      required this.productQuantity,
      required this.productPrice});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    var primaryColor;
    return Container(
        height: 25,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isTrue == true
            ? Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                InkWell(
                  onTap: () {
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: primaryColor,
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                      color: Colors.brown, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    child:
                    Icon(
                      Icons.add,
                      size: 15,
                    );
                  },
                ),
              ])
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    // reviewCartProvider.addReviewCartData
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ));
  }
}
