import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/controllers/admin_controller.dart';
import 'package:grocery_app/screens/admin/admin_home.dart';
import 'package:grocery_app/widgets/rounded_button.dart';
import 'package:grocery_app/widgets/rounded_input.dart';
import 'package:uuid/uuid.dart';

class AdminUpload extends StatefulWidget {
  const AdminUpload({Key? key}) : super(key: key);

  @override
  State<AdminUpload> createState() => _AdminUploadState();
}

class _AdminUploadState extends State<AdminUpload> {
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference requests =
      FirebaseFirestore.instance.collection('HerbsProduct');
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Admin DashBoard"),
      ),
      body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Center(
                child: Column(
              children: [
                RoundedInput(
                  label: "Product Image",
                  hint: "Provide Image link",
                  icon: Icons.image,
                  onChanged: (String value) {
                    setState(() {
                      adminCntrler.changeImage(value);
                    });
                  },
                ),
                RoundedInput(
                  label: "Product Name",
                  hint: "Name of Product",
                  icon: Icons.label,
                  onChanged: (String value) {
                    setState(() {
                      adminCntrler.changeName(value);
                    });
                  },
                ),
                RoundedInput(
                  label: "Product Price",
                  hint: "Price of product",
                  icon: Icons.money,
                  onChanged: (String value) {
                    setState(() {
                      adminCntrler.changePrice(value);
                    });
                  },
                ),
                RoundedInput(
                  label: "Product Quantity",
                  hint: "Quantity of a product",
                  icon: Icons.production_quantity_limits,
                  onChanged: (String value) {
                    setState(() {
                      adminCntrler.changeQuantity(value);
                    });
                  },
                ),
                GetBuilder<AdminController>(
                    init: AdminController(),
                    builder: (admin) {
                      return RoundedButton(
                          text: "Upload Product",
                          press: () {
                            if (formkey.currentState!.validate()) {
                              requestBlood(admin.imageIink, admin.productName,
                                  admin.productPrice, admin.productQty);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const AdminHome())),
                                  (route) => true);
                            }
                          },
                          color: Colors.red);
                    }),
                SizedBox(
                  height: size.height * 0.02,
                )
              ],
            )),
          )),
    );
  }

  // upload products

  Future<void> requestBlood(
      String imageLink, String name, String price, String quantity) {
    var uuid = Uuid();
    return requests
        .add({
          'productId': uuid.v1(),
          'productImage': imageLink,
          'productName': name,
          'productPrice': price,
          'productQuantity': quantity,
        })
        .then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Product Uploaded"))))
        .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to upload product: $error"))));
  }
}
