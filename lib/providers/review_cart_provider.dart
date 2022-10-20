import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/models/review_cart_model.dart';
import 'package:grocery_app/screens/review_cart/review_cart.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
    var cartUnit,
    required BuildContext context,
  }) async {
    FirebaseFirestore.instance.collection("YourReviewCart").add(
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
  }

  List<ReviewCartModel> reviewCartDataList = [];

  getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    var reviewCartValue = await FirebaseFirestore.instance
        .collection("YourReviewCart")
        // .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    reviewCartValue.docs.forEach((element) {
      var data = element.data();
      // var data = result.data;
      // var data = currentUser;
      ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: data["cartId"],
          cartName: data["cartName"],
          cartImage: data["cartImage"],
          cartPrice: data["cartPrice"],
          cartQuantity: data["cartQuantity"],
          cartUnit: data["cartUnit"],
          isAdd: data["isAdd"]);
      newList.add(reviewCartModel);
      reviewCartDataList = newList;
    });
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList => reviewCartDataList;
// TotalPrice  ///

  getTotalPrice() {
    double total = 0.0;
    reviewCartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;
    });
    return total;
  }

// ReviCartDeleteFunction
  reviewCartDataDelete(cartId) async {
    await FirebaseFirestore.instance
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
  }
}
