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

//////////////// Fresh Product ///////////////////////////////////////

  List<ProductModel> freshProductList = [];

  fatchFreshProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Fruits").get();
    print("request returned ${value.docs.length}");
    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(ProductModel(
          productImage: element.get("productImage"),
          productName: element.get("productName"),
          productPrice: element.get("productPrice"),
          productId: element.get("productId"),
          // productUnit: element.get("productUnit"),
          productQuantity: element.get("productQuantity"),
        ));
      },
    );
    freshProductList = newList;
    // print(herbsProductList.length);
    notifyListeners();
  }

  List<ProductModel> get getFreshProductDataList => freshProductList;

//////////////// Root Product ///////////////////////////////////////

  List<ProductModel> rootProductList = [];

  fatchRootProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("RootVegs").get();

    value.docs.forEach(
      (element) {
        print(
          element.get("productName"),
        );
        productModels(element);
        newList.add(ProductModel(
          productImage: element.get("productImage"),
          productName: element.get("productName"),
          productPrice: element.get("productPrice"),
          productId: element.get("productId"),
          // productUnit: element.get("productUnit"),
          productQuantity: element.get("productQuantity"),
        ));
      },
    );
    rootProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getRootProductDataList {
    return rootProductList;
  }

  List<ProductModel> get getHerbsProductDataList => herbsProductList;

  /////////////////// Search Return ////////////
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
