import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/widgets/single_item.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    var data;
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "UGX 1000",
          style: TextStyle(color: Colors.green[900]),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primarycolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
          ),
        ),
      ),
      appBar: AppBar(
          title: Text("ReviewCart",
              style: TextStyle(
                color: textColor,
              ))),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleItem(
            isBool: true,
            productImage: data.productImage,
            productName: data.productName,
            productPrice: data.productPrice,
          ),
          SingleItem(
            isBool: true,
            productImage: data.productImage,
            productName: data.productName,
            productPrice: data.productPrice,
          ),
          SingleItem(
            isBool: true,
            productImage: data.productImage,
            productName: data.productName,
            productPrice: data.productPrice,
          ),
          SingleItem(
            isBool: true,
            productImage: data.productImage,
            productName: data.productName,
            productPrice: data.productPrice,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
