import 'package:get/get.dart';
import 'package:grocery_app/models/cart_model.dart';

final cartContrl = Get.put(CartController());

class CartController extends GetxController {
  List<CartModel> cart = [];

  addToCart(CartModel cartProducts) {
    cart.addAll([cartProducts]);
    update();
  }

    getTotalPrice() {
    double total = 0.0;
    cart.forEach((element) {
      total += element.productPrice * element.productQuantity;
    });
    return total;
  }
}
