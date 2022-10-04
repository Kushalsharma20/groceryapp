import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/screens/product_overview/product_overview.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';

class SingalProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  final Function onTap;

  SingalProduct({
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    var primaryColor;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    var herbsProductData;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductOverview(
                              productImage: herbsProductData.productImage,
                              productName: herbsProductData.productName,
                              productPrice: herbsProductData.productPrice,
                            )));
                  },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      productImage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${productPrice}\UGX 1000 Gram',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 5),
                                height: 25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
// Quantity

                                    Expanded(
                                        child: Text(
                                      '50 Gram',
                                      style: TextStyle(fontSize: 10),
                                    )),

// Arrow

                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 19,
                                        color: Colors.brown,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

//This Is Second Rectangular Container

                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
