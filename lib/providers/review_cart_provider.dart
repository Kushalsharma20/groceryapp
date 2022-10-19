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
    FirebaseFirestore.instance
        .collection("YourReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        // .collection("YourReviewCart")
        // .doc(cartId)
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
  }

  void updateReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .update(
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

    QuerySnapshot reviewCartValue = (await FirebaseFirestore.instance
        .collection("YourReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()) as QuerySnapshot<ReviewCartModel?>;
    // .collection("YourReviewCart")
    // .get();
    print("data received");
    print(reviewCartValue.docs.length);
    reviewCartValue.docs.forEach((element) {
      // ReviewCartModel reviewCartModel = ReviewCartModel(
      //     cartId: element.get("cartId"),
      //     cartImage: element.get("cartImage"),
      //     cartName: element.get("cartName"),
      //     cartPrice: element.get("cartPrice"),
      //     cartQuantity: element.get("cartQuantity"),
      //     cartUnit: element.get("cartUnit"),
      //     isAdd: element.get("isAdd"));
      // print("add added to cart model");
      // print(reviewCartDataList[0].cartId);
      // print(reviewCartDataList[0].cartName);
      newList.addAll([
        ReviewCartModel(
            cartId: element.get("cartId"),
            cartImage: element.get("cartImage"),
            cartName: element.get("cartName"),
            cartPrice: element.get("cartPrice"),
            cartQuantity: element.get("cartQuantity"),
            cartUnit: element.get("cartUnit"))
      ]);
      print(newList.length);
    });
    print("add data to cart model");
    reviewCartDataList = newList;
    print(reviewCartDataList);
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList => reviewCartDataList;

//// TotalPrice  ///

  getTotalPrice() {
    double total = 0.0;
    reviewCartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;
    });
    return total;
  }

////////////// ReviCartDeleteFunction ////////////
  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
