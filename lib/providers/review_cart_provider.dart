import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/review_cart_model.dart';
import 'package:grocery_app/screens/review_cart/review_cart.dart';

class ReviewCartProvider with ChangeNotifier {
  double total = 0.0;

  void addReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
    var cartUnit,
    required BuildContext context,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("YourReviewCart")
          .doc(cartId)
          .set(
        {
          "cartId": cartId,
          "cartName": cartName,
          "cartImage": cartImage,
          "cartPrice": cartPrice,
          "cartQuantity": cartQuantity,
          "cartUnit": cartUnit,
          "isAdd": true,
        },
      ).then((value) => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReviewCart(),
                ),
              ));
    } catch (e) {
      print("Error in adding product " + e.toString());
    }
  }

  void updateReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    FirebaseFirestore.instance.collection("YourReviewCart").doc(cartId).update(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
    notifyListeners();
  }

  getReviewCartData(var cartData) async {
    // var reviewCartValue =
    //     await FirebaseFirestore.instance.collection("YourReviewCart").get();
    cartData.forEach((element) {
      var item = element.data();
      total += item["cartPrice"] * item["cartQuantity"];
    });

    // notifyListeners();
  }

// TotalPrice  ///

  double get totalCartCost => total;

// ReviCartDeleteFunction
  reviewCartDataDelete(cartId) async {
    await FirebaseFirestore.instance
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
  }
}
