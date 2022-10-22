import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// import 'package:grocery_app/models/cart_model.dart';

final cartContrl = Get.put(CartController());

class CartController extends GetxController {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> prov = [];

  void setData(List<QueryDocumentSnapshot<Map<String, dynamic>>> value) {
    this.prov = value;
    update();
  }

  double getTotalPrice() {
    if (prov.length == 0) {
      return 0.0;
    } else {
      double total = 0.0;
      for (var i = 0; i < prov.length; i++) {
        total += prov[i]["cartPrice"] * prov[i]["cartQuantity"];
      }
      update();
      return total;
    }
  }
}
