import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  Widget singalProducts() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 160,
        height: 230,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Expanded(
              child: Image.network(
                  "https://www.veggycation.com.au/siteassets/veggycationvegetable/basil.jpg")),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fresh Basil",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "1000/=/100g",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.only(left: 5),
                            height: 30,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "100 Gram",
                                  style: TextStyle(fontSize: 10),
                                )),
                                Center(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Colors.yellow,
                                  ),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //+ or -
                            Icon(Icons.remove,
                                size: 15, color: Color(0xffdd0b84c)),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Color(0xffdd0b84c),
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.add,
                              size: 15,
                              color: Color(0xffdd0b84c),
                            ),
                          ],
                        ),
                      )),
                    ])
                  ]),
            ),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffcbcbcb),
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            CircleAvatar(
                radius: 12,
                backgroundColor: Color.fromARGB(167, 31, 167, 230),
                child: Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Color.fromARGB(255, 56, 214, 64),
                  child: Icon(
                    Icons.shop,
                    size: 18,
                    color: Colors.black,
                  ),
                )),
          ],
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          backgroundColor: Color(0xffd6b738),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://cdn-2.tstatic.net/travel/foto/bank/images/blueberry_20160901_120145.jpg')),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Herbs Seasonings'),
                    Text(
                      'View All',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      singalProducts(),
                      singalProducts(),
                      singalProducts(),
                      singalProducts(),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fresh Fruits'),
                    Text(
                      'View All',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      singalProducts(),
                      singalProducts(),
                      singalProducts(),
                      singalProducts(),
                    ],
                  )),
            ])));
  }
}
