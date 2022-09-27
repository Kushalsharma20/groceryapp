import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 100,
          child: Center(
            child: Image.network(""),
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
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.bold),
                ),
                Text(
                  "1000\/=/100 grams",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ]),
            ],
          ),
        )),
        Expanded(
            child: Container(
          height: 100,
        ))
      ],
    );
  }
}
