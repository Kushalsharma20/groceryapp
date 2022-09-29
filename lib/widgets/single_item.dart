import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  SingleItem({required this.isBool});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 100,
            child: Center(
              child: Image.network(
                  "https://www.veggycation.com.au/siteassets/veggycationvegetable/basil.jpg"),
            ),
          )),
          Expanded(
              child: Container(
            height: 100,
            child: Column(
              mainAxisAlignment: isBool == false
                  ? MainAxisAlignment.spaceAround
                  : MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  Text(
                    "Product Name",
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "1000\/=/100 grams",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ]),
                isBool == false
                    ? Container(
                        margin: EdgeInsets.only(right: 15),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "100 grams",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Center(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: primarycolor,
                              ),
                            )
                          ],
                        ),
                      )
                    : Text("100 Gram")
              ],
            ),
          )),
          Expanded(
              child: Container(
                  height: 100,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: EdgeInsets == false
                      ? Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: primarycolor,
                                  size: 20,
                                ),
                                Text(
                                  "ADD",
                                  style: TextStyle(
                                    color: primarycolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 25,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: primarycolor,
                                      size: 20,
                                    ),
                                    Text(
                                      "ADD",
                                      style: TextStyle(
                                        color: primarycolor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))),
        ],
      ),
    );
    isBool == false
        ? Container()
        : Divider(
            height: 1,
            color: Colors.black45,
          );
  }
}
