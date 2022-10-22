import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/controllers/admin_controller.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/providers/user_provider.dart';
import 'package:grocery_app/screens/product_overview/product_overview.dart';
import 'package:grocery_app/screens/home/singal_product.dart';
import 'package:grocery_app/screens/review_cart/review_cart.dart';
import 'package:grocery_app/screens/search/search.dart';
import 'package:provider/provider.dart';
import 'drawer_side.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;

  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                    top: 4,
                    bottom: 4,
                    start: 4,
                    end: MediaQuery.of(context).size.width * .7),
                width: double.infinity,
                color: Color.fromRGBO(254, 226, 204, 1),
                child: FittedBox(
                  child: Column(
                    children: [
                      Text(
                        "Up to 30% Off",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "On all vegetable products",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Herbs Seasonings'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getHerbsProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHerbsProductDataList.map(
              (herbsProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: herbsProductData.productId,
                          productPrice: herbsProductData.productPrice,
                          productName: herbsProductData.productName,
                          productImage: herbsProductData.productImage,
                          productQuantity: herbsProductData.productQuantity,
                        ),
                      ),
                    );
                  },
                  productId: herbsProductData.productId,
                  productPrice: herbsProductData.productPrice,
                  productImage: herbsProductData.productImage,
                  productName: herbsProductData.productName,
                  productQuantity: herbsProductData.productQuantity,
                  // productUnit: herbsProductData,
                );
              },
            ).toList(),
            // children: [

            // ],
          ),
        ),
      ],
    );
  }

  Widget _buildFreshProduct(context) {
    productProvider.fatchFreshProductData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                    top: 4,
                    bottom: 4,
                    start: 4,
                    end: MediaQuery.of(context).size.width * .7),
                width: double.infinity,
                color: Color.fromRGBO(254, 226, 204, 1),
                child: FittedBox(
                  child: Column(
                    children: [
                      Text(
                        "Up to 30% Off",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "On all vegetable products",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fresh Fruits'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getFreshProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFreshProductDataList.map(
              (freshProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: freshProductData.productId,
                          productImage: freshProductData.productImage,
                          productName: freshProductData.productName,
                          productPrice: freshProductData.productPrice,
                          productQuantity: freshProductData.productQuantity,
                        ),
                      ),
                    );
                  },
                  productId: freshProductData.productId,
                  productImage: freshProductData.productImage,
                  productName: freshProductData.productName,
                  productPrice: freshProductData.productPrice,
                  productQuantity: freshProductData.productQuantity,
                  // productUnit: freshProductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRootProduct() {
    productProvider.fatchRootProductData();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                    top: 4,
                    bottom: 4,
                    start: 4,
                    end: MediaQuery.of(context).size.width * .7),
                width: double.infinity,
                color: Color.fromRGBO(254, 226, 204, 1),
                child: FittedBox(
                  child: Column(
                    children: [
                      Text(
                        "Up to 30% Off",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "On all vegetable products",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Root Vegetable'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Search(
                        search: productProvider.getRootProductDataList,
                      ),
                    ),
                  );
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getRootProductDataList.map(
              (rootProductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: rootProductData.productId,
                          productImage: rootProductData.productImage,
                          productName: rootProductData.productName,
                          productPrice: rootProductData.productPrice,
                          productQuantity: rootProductData.productQuantity,
                        ),
                      ),
                    );
                  },
                  productId: rootProductData.productId,
                  productImage: rootProductData.productImage,
                  productName: rootProductData.productName,
                  productPrice: rootProductData.productPrice,
                  productQuantity: rootProductData.productQuantity,
                  // productUnit: rootProductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider initproductProvider = Provider.of(context);
    initproductProvider.fatchHerbsProductData();
    initproductProvider.fatchFreshProductData();
    initproductProvider.fatchRootProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    int btmSelectedIndex = 0;
    //List screens = [Home(), Categories(), Cart(), UserScreen()];
    return Scaffold(
      drawer: DrawerSide(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(254, 226, 204, 1),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd6d382),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Search(search: productProvider.getAllProductSearch),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: Color(0xffd6d382),
                radius: 15,
                child: Icon(
                  Icons.shop,
                  size: 17,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: btmSelectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_outlined),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Account"),
          BottomNavigationBarItem(
              icon: Icon(Icons.help_outline), label: "Help"),
        ],
      ),

      // appBar: AppBar(
      //   backgroundColor: Colors.redAccent,
      //   iconTheme: IconThemeData(color: textColor),
      //   title: Text(
      //     'Home',
      //     style: TextStyle(color: textColor, fontSize: 17),
      //   ),
      //   actions: [
      //     CircleAvatar(
      //       radius: 15,
      //       backgroundColor: Color(0xffd6d382),
      //       child: IconButton(
      //         onPressed: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(
      //               builder: (context) =>
      //                   Search(search: productProvider.getAllProductSearch),
      //             ),
      //           );
      //         },
      //         icon: Icon(
      //           Icons.search,
      //           size: 17,
      //           color: textColor,
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 5),
      //       child: GestureDetector(
      //         onTap: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(
      //               builder: (context) => ReviewCart(),
      //             ),
      //           );
      //         },
      //         child: CircleAvatar(
      //           backgroundColor: Color(0xffd6d382),
      //           radius: 15,
      //           child: Icon(
      //             Icons.shop,
      //             size: 17,
      //             color: textColor,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/groc.jpg'),
                ),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 130, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Vegi',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Text(
                          //   '30% Off',
                          //   style: TextStyle(
                          //       fontSize: 40,
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.bold),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20),
                          //   child: Text(
                          //     'On all vegetables products',
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
            _buildHerbsProduct(context),
            _buildFreshProduct(context),
            _buildRootProduct(),
          ],
        ),
      ),
    );
  }
}
