import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Container(
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
              ],
            ),
          )),
          Expanded(
              child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 32),
            child: Container(
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
            ),
          ))
        ],
      ),
    );
  }
}
