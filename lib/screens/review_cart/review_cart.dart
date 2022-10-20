// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/providers/review_cart_provider.dart';
import 'package:grocery_app/widgets/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatefulWidget {
  @override
  State<ReviewCart> createState() => _ReviewCartState();
}

class _ReviewCartState extends State<ReviewCart> {
  late ReviewCartProvider reviewCartProvider;

  double totalCartPrice = 0.0;

  showAlertDialog(BuildContext context, var delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete["cartId"]);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(
        child: Text(
          "Cart Product",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      content: Text("Are you sure you want to delete "),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  getTotalPrice(List<QueryDocumentSnapshot<Map<String, dynamic>>>? prov) {
    // double total = 0.0;
    prov!.forEach((element) {
      totalCartPrice += (element["cartPrice"]) * (element["cartQuantity"]);
    });
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 226, 204, 1),
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("YourReviewCart")
              .snapshots(),
          builder: (context, snapshot) {
            var dat = snapshot.data?.docs;
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator.adaptive())
                : dat!.isEmpty
                    ? Center(
                        child: Text("NO DATA"),
                      )
                    : ListView.builder(
                        itemCount: dat.length,
                        itemBuilder: (context, index) {
                          // return Text(dat[index]["cartName"]);
                          reviewCartProvider.getReviewCartData(dat);

                          getTotalPrice(dat);

                          return Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              SingleItem(
                                isBool: true,
                                wishList: false,
                                productImage: dat[index]["cartImage"],
                                productName: dat[index]["cartName"],
                                productPrice: dat[index]["cartPrice"],
                                productId: dat[index]["cartId"],
                                productQuantity: dat[index]["cartQuantity"],
                                // productUnit: data.cartUnit,
                                onDelete: () {
                                  showAlertDialog(context, dat[index]);
                                },
                                providerState: reviewCartProvider,
                              ),
                            ],
                          );
                        },
                      );
          }),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$ ${totalCartPrice}",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Checkout"),
            color: Color.fromRGBO(254, 226, 204, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () {
              // if (reviewCartProvider.getReviewCartDataList.isEmpty) {}
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => Vegipay(),
              //   ),
              // );
            },
          ),
        ),
      ),
    );
  }
}
