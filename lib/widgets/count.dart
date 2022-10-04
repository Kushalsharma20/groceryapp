import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    var primaryColor;
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.remove,
            size: 15,
            color: primaryColor,
          ),
          Text(
            "1",
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.add,
            size: 15,
          ),
        ],
      ),
    );
  }
}
