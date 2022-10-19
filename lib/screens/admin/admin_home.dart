import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/admin_controller.dart';
import 'package:grocery_app/screens/admin/upload_page.dart';
import 'package:grocery_app/screens/home/singal_product.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    adminCntrler.fetchHerbsProductData();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: GetBuilder<AdminController>(
              init: AdminController(),
              builder: (admin) {
                return Column(
                  children: admin.herbsProductList.map(
                    (herbsProductData) {
                      return SingalProduct(
                        onTap: () {},
                        productId: herbsProductData.productId,
                        productPrice: herbsProductData.productPrice,
                        productImage: herbsProductData.productImage,
                        productName: herbsProductData.productName,
                        productQuantity: herbsProductData.productQuantity,
                      );
                    },
                  ).toList(),
                );
              }),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.add_alert),
              label: "Upload Product",
              backgroundColor: Colors.red,
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: ((context) => const AdminUpload())),
                    (route) => true);
              }),
        ],
      ),
    );
  }
}
