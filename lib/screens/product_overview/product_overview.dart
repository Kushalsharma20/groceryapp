import "package:flutter/material.dart";
import 'package:grocery_app/config/colors.dart';

class ProductOverview extends StatefulWidget {
  const ProductOverview({super.key});

  @override
  State<ProductOverview> createState() => _ProductOverview();
}

class _ProductOverview extends State<ProductOverview> {
  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
            backgroundColor: textColor,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add TO Wishlist",
            iconData: Icons.favorite_outline,
          ),
          bonntonNavigatorBar(
            backgroundColor: primarycolor,
            color: textColor,
            iconColor: Colors.white70,
            title: "GoTo Cart",
            iconData: Icons.shop_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Product Overview",
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
