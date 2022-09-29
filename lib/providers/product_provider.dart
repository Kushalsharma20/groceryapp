import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> herbsProductList = [];
  late ProductModel productModel;
  fatchHerbsProductData() async {
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    value.docs.forEach(
      (element) {
        print(element.data());
        // productModel = ProductModel(
        // productImage:

        // );
      },
    );
  }
}
