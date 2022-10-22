import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/config/colors.dart';
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
  var catController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          "Admin DashBoard",
          style: TextStyle(color: Colors.black),
        ),
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
                  label: "Product Category",
                  hint: "Category eg HerbsProduct,Fruits..",
                  onTap: () => showCategories(),
                  icon: Icons.category,
                  handler: catController,
                  // onChanged: (String value) {
                  //   setState(() {
                  //     adminCntrler.changeName(value);
                  //   });
                  // },
                ),
                RoundedInput(
                  label: "Product Price",
                  hint: "Price of product",
                  icon: Icons.money,
                  onChanged: (value) {
                    setState(() {
                      adminCntrler.changePrice(int.parse(value));
                    });
                  },
                ),
                RoundedInput(
                  label: "Product Quantity",
                  hint: "Quantity of a product",
                  icon: Icons.production_quantity_limits,
                  onChanged: (value) {
                    setState(() {
                      adminCntrler.changeQuantity(int.parse(value));
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
      String imageLink, String name, int price, int quantity) {
    var uuid = Uuid();
    return adminCntrler.getCollection
        .doc(uuid.v1())
        .set({
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

  void showCategories() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return BottomSheet(
              backgroundColor: Colors.transparent,
              onClosing: () {},
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: ListView(
                    children: List.generate(
                      adminCntrler.cats.length,
                      (index) => ListTile(
                        hoverColor: Colors.black38,
                        onTap: () {
                          setState(() {
                            Navigator.pop(context);
                            // group = groups[index];
                            adminCntrler
                                .setCollectionName(adminCntrler.cats[index]);
                            setState(() {
                              catController.text = adminCntrler.cats[index];
                            });
                          });
                          // catController.text = cats[index];
                        },
                        title: Center(
                          child: Text(
                            adminCntrler.cats[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
