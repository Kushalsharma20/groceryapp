import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocery_app/models/product_model.dart';

final adminCntrler = Get.put(AdminController());

class AdminController extends GetxController {
  String imageIink = '';
  String productName = '';
  String productPrice = '';
  String productQty = '';
  List<ProductModel> herbsProductList = [];
  List<ProductModel> search = [];
  late ProductModel productModel;

  changeImage(String value) {
    imageIink = value;
    update();
  }

  changeName(String value) {
    productName = value;
    update();
  }

  changePrice(String value) {
    productPrice = value;
    update();
  }

  changeQuantity(String value) {
    productQty = value;
    update();
  }

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productId: element.get("productId"),
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productQuantity: element.get("productQuantity"),
    );
    search.add(productModel);
    update();
  }

  fetchHerbsProductData() async {
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
    update();
  }
}
