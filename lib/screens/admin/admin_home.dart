import 'package:cloud_firestore/cloud_firestore.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adminCntrler.fetchAll();

    // print("Fetched ${adminCntrler.allData.length} products");
    return Scaffold(
      body: GridView.builder(
          itemCount: adminCntrler.allData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            var herbsProductData = adminCntrler.allData;
            // return GridTile(child: Text("Hi"));
            return InkWell(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                              "Are you sure you want to delete ${herbsProductData[index][0].productName} ?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  adminCntrler.removePdt(
                                      herbsProductData[index][1],
                                      herbsProductData[index][0].productId);
                                  Navigator.pop(context);
                                },
                                child: Text("Yes",
                                    style: TextStyle(color: Colors.blue))),
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(
                                  "No",
                                  style: TextStyle(color: Colors.red),
                                ))
                          ],
                        ));
              },
              child: SingalProduct(
                onTap: () {},
                productId: herbsProductData[index][0].productId,
                productPrice: herbsProductData[index][0].productPrice,
                productImage: herbsProductData[index][0].productImage,
                productName: herbsProductData[index][0].productName,
                productQuantity: herbsProductData[index][0].productQuantity,
              ),
            );
          }),
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
