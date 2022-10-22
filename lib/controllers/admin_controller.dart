import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:grocery_app/models/product_model.dart';

final adminCntrler = Get.put(AdminController());

class AdminController extends GetxController {
  String imageIink = '';
  String productName = '';
  List allCatList = [];

  int productPrice = 0;
  int productQty = 0;
  List<ProductModel> herbsProductList = [];
  // List<String> categories = ["HerbsProduct", "Fruits", "RootVegs"];
  List<ProductModel> search = [];
  late ProductModel productModel;
  late CollectionReference requests;

  setCollectionName(String name) {
    requests = FirebaseFirestore.instance.collection(name);
    update();
  }

  List<String> get cats => ["HerbsProduct", "Fruits", "RootVegs"];
  List get allData => allCatList;
  CollectionReference get getCollection => requests;

  changeImage(String value) {
    imageIink = value;
    update();
  }

  changeName(String value) {
    productName = value;
    update();
  }

  changePrice(int value) {
    productPrice = value;
    update();
  }

  changeQuantity(int value) {
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

  List<ProductModel> fetchProductData(String collectionName) {
    List<ProductModel> newList = [];
    FirebaseFirestore.instance.collection(collectionName).get().then((value) {
      value.docs.forEach((element) {
        productModels(element);
        productModel = ProductModel(
          productId: element.get("productId"),
          productImage: element.get("productImage"),
          productName: element.get("productName"),
          productPrice: element.get("productPrice"),
          productQuantity: element.get("productQuantity"),
        );
        newList.add(productModel);
      });
    });
    // value.docs.forEach(
    //   (element) {
    //     productModels(element);
    //     newList.add(productModel);
    //   },
    // );

    update();
    return newList;
  }

  // function to fetch all firebase collections with their products
  void fetchAll() async {
    List allCat = [];
    for (var i = 0; i < cats.length; i++) {
      var value = await FirebaseFirestore.instance.collection(cats[i]).get();
      value.docs.forEach((element) {
        var pdt = ProductModel(
          productId: element.get("productId"),
          productImage: element.get("productImage"),
          productName: element.get("productName"),
          productPrice: element.get("productPrice"),
          productQuantity: element.get("productQuantity"),
        );

        allCat.add([pdt, cats[i]]);
        allCatList = allCat;
        print("All data: ${allCatList.toString()}");
      });
    }
    // update();
  }

  removePdt(String cat, String pdtId) async {
    await FirebaseFirestore.instance.collection(cat).doc(pdtId).delete();
    update();
  }
}
