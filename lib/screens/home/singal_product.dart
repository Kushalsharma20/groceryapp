import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/widgets/count.dart';
import 'package:grocery_app/widgets/product_unit.dart';

class SingalProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final Function onTap;
  final String productId;
  final int productQuantity;
  // final ProductModel productUnit;
  SingalProduct(
      {required this.productId,
      required this.productImage,
      required this.productName,
      // required this.productUnit,
      required this.onTap,
      required this.productPrice,
      required this.productQuantity});

  @override
  _SingalProductState createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    // widget.productUnit.productUnit.firstWhere((element) {
    //   setState(() {
    //     firstValue = element;
    //   });
    //   return true;
    // });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 200,
            width: 165,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap as void Function()?,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage,
                      fit: BoxFit.fill,
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
                            widget.productName,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'UGX ${widget.productPrice}\        ${widget.productQuantity}Kg',
                            // \$/${unitData == null ? firstValue : unitData}

                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              //   Expanded(
                              //       child: Container(
                              //     padding: EdgeInsets.only(left: 5),
                              //     height: 35,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Colors.grey,
                              //       ),
                              //       borderRadius: BorderRadius.circular(8),
                              //     ),
                              //     child: Row(children: [
                              //       Expanded(
                              //         child: Text(
                              //           "50 Gram",
                              //           style: TextStyle(
                              //             color: Colors.grey,
                              //             fontSize: 14,
                              //           ),
                              //         ),
                              //       ),
                              //       Center(
                              //         child: Icon(
                              //           Icons.arrow_drop_down,
                              //           size: 20,
                              //           color: primaryColor,
                              //         ),
                              //       ),
                              //     ]),
                              //   )),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              // Container(
                              //   padding: EdgeInsets.symmetric(
                              //     horizontal: 10,
                              //     vertical: 5,
                              //   ),
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       color: Colors.grey,
                              //     ),
                              //     borderRadius: BorderRadius.circular(
                              //       10,
                              //     ),
                              //   ),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Icon(
                              //         Icons.add,
                              //         size: 17,
                              //         color: primaryColor,
                              //       ),
                              //       Text(
                              //         "ADD",
                              //         style: TextStyle(color: primaryColor),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            ],
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: ProductUnit(
                            //         onTap: () {
                            //           showModalBottomSheet(
                            //               context: context,
                            //               builder: (context) {
                            //                 return Column(
                            //                   mainAxisSize: MainAxisSize.min,
                            //                   crossAxisAlignment:
                            //                       CrossAxisAlignment.start,
                            //                   children: widget
                            //                       .productUnit.productUnit!
                            //                       .map<Widget>((data) {
                            //                     return Column(
                            //                       children: [
                            //                         Padding(
                            //                           padding: const EdgeInsets
                            //                                   .symmetric(
                            //                               vertical: 10,
                            //                               horizontal: 10),
                            //                           child: InkWell(
                            //                             onTap: () async {
                            //                               setState(() {
                            //                                 unitData = data;
                            //                               });asrdfgjkl,
                            //                               Navigator.of(context)
                            //                                   .pop();
                            //                             },
                            //                             child: Text(
                            //                               data,
                            //                               style: TextStyle(
                            //                                   color: primaryColor,
                            //                                   fontSize: 18),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     );
                            //                   }).toList(),
                            //                 );
                            //               });
                            //         },
                            //         title: unitData == null ? firstValue : unitData,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Count(
                            //       productId: widget.productId,
                            //       productImage: widget.productImage,
                            //       productName: widget.productName,
                            //       productPrice: widget.productPrice,
                            //       // productUnit:
                            //       //     unitData == null ? firstValue : unitData,
                            //     ),
                            //   ],
                            // ),
                          )
                        ]),
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
