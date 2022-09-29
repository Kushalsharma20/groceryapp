import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/single_item.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Search"), actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ]),
        body: ListView(
          children: [
            ListTile(
              title: Text("Items"),
            ),
            Container(
              height: 52,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color(0xffc2c2c2),
                    filled: true,
                    hintText: "Search for items in the store",
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleItem(
              isBool: true,
            ),
            SingleItem(
              isBool: true,
            ),
            SingleItem(
              isBool: true,
            ),
            SingleItem(
              isBool: true,
            ),
            SingleItem(
              isBool: true,
            ),
          ],
        ));
  }
}
