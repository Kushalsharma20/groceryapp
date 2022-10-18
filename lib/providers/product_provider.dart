import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
      // productUnit: element.get("productUnit"),
      productQuantity: element.get("productQuantity"),
    );
    search.add(productModel);
  }

  /////////////// herbsProduct ///////////////////////////////
  List<ProductModel> herbsProductList = [];

  fatchHerbsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProduct").get();
    print("request returned ${value.docs.length}");
    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(productModel);
      },
    );
    herbsProductList = newList;
    print(herbsProductList.length);
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductDataList {
    // print(herbsProductList[0].productId);
    // print(herbsProductList[0].productImage);
    // print(herbsProductList[0].productName);
    // print(herbsProductList[0].productPrice);
    // print(herbsProductList[0].productQuantity);
    return herbsProductList;
  }

//////////////// Fresh Product ///////////////////////////////////////

  List<ProductModel> freshProductList = [];

  fatchFreshProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FreshProduct").get();

    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }

//////////////// Root Product ///////////////////////////////////////

  List<ProductModel> rootProductList = [];

  fatchRootProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("RootProduct").get();

    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    rootProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductDataList {
    return rootProductList;
  }

  /////////////////// Search Return ////////////
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
