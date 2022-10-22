import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
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
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Herbs Seasonings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fresh Fruits',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Root Vegetable',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
    ProductProvider initproductProvider = Provider.of(context, listen: false);
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
          backgroundColor: primaryColor,
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
        body: ListView(
          children: [
            CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/dd.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //2nd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/grey.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //3rd Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/white.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/black.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/groc.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/zed.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/yellow.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Container(
            //     child: Column(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(right: 130, bottom: 10),
            //           child: Container(
            //             height: 50,
            //             width: 100,
            //             decoration: BoxDecoration(
            //               color: primaryColor,
            //               borderRadius: BorderRadius.only(
            //                 bottomRight: Radius.circular(50),
            //                 bottomLeft: Radius.circular(50),
            //               ),
            //             ),
            //             child: Center(
            //               child: Text(
            //                 'Vegi',
            //                 style: TextStyle(
            //                   fontSize: 20,
            //                   color: Colors.white,
            //                   shadows: [
            //                     BoxShadow(
            //                         color: Colors.grey,
            //                         blurRadius: 10,
            //                         offset: Offset(3, 3))
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Text(
            //           '30% Off',
            //           style: TextStyle(
            //               fontSize: 40,
            //               color: Colors.yellow,
            //               fontWeight: FontWeight.bold),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 20),
            //           child: Text(
            //             'On all vegetables products',
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(),
            ),
            _buildHerbsProduct(context),
            _buildFreshProduct(context),
            _buildRootProduct(),
          ],
        ));
    // body: Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //   child: ListView(
    //     children: [
    //       Container(
    //         height: 200,
    //         decoration: BoxDecoration(
    //           image: DecorationImage(
    //             fit: BoxFit.cover,
    //             image: AssetImage('assets/white.jpg'),
    //           ),
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(10),
    //         ),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               flex: 2,
    //               child: Container(
    //                 child: Column(
    //                   children: [
    //                     Padding(
    //                       padding:
    //                           const EdgeInsets.only(right: 130, bottom: 10),
    //                       child: Container(
    //                         height: 50,
    //                         width: 100,
    //                         decoration: BoxDecoration(
    //                           color: primaryColor,
    //                           borderRadius: BorderRadius.only(
    //                             bottomRight: Radius.circular(50),
    //                             bottomLeft: Radius.circular(50),
    //                           ),
    //                         ),
    //                         child: Center(
    //                           child: Text(
    //                             'Vegi',
    //                             style: TextStyle(
    //                               fontSize: 20,
    //                               color: Colors.white,
    //                               shadows: [
    //                                 BoxShadow(
    //                                     color: Colors.grey,
    //                                     blurRadius: 10,
    //                                     offset: Offset(3, 3))
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Text(
    //                       '30% Off',
    //                       style: TextStyle(
    //                           fontSize: 40,
    //                           color: Colors.yellow,
    //                           fontWeight: FontWeight.bold),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 20),
    //                       child: Text(
    //                         'On all vegetables products',
    //                         style: TextStyle(
    //                           color: Colors.white,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Expanded(
    //               child: Container(),
    //             ),
    //           ],
    //         ),
    //       ),
    // _buildHerbsProduct(context),
    // _buildFreshProduct(context),
    // _buildRootProduct(),
    //],
    // ),
    // ),
  }
}
