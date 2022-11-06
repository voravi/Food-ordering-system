import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_system/providers/product_db_controller.dart';
import 'package:food_ordering_system/utils/colours.dart';
import 'package:food_ordering_system/utils/globals.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:provider/provider.dart';
import '../../../modals/product.dart';
import '../../../providers/product_provider.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({Key? key}) : super(key: key);

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  TextEditingController searchController = TextEditingController();
  String search = "";

  bool act1 = true;
  bool act2 = false;
  bool act3 = false;
  bool act4 = false;
  late Future<RxList<Product>> productDataList;
  late Future<List<Product>> productList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productList = ProductDBHelper.productDBHelper.fetchAllData();
    log(productList.toString(), name: "Product List Data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.decrease_indent,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      color: primaryColor,
                      size: 25,
                    ),
                    Text(
                      " Magura, BD",
                      style: TextStyle(color: blackShade4, fontSize: 19),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/man.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hi Ravi",
              style: TextStyle(color: primaryColor, fontSize: 25, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Find your food",
              style: TextStyle(color: blackShade1, fontWeight: FontWeight.w900, fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: searchController,
              textInputAction: TextInputAction.done,
              onSaved: (val) {
                setState(() {
                  search = val!;
                });
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter Some value";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: secondaryColor,
                border: InputBorder.none,
                hintText: "Search Food",
                hintStyle: TextStyle(fontSize: 18),
                prefixIcon: Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                suffixIcon: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      setState(() {
                        act1 = true;
                        act2 = false;
                        act3 = false;
                        act4 = false;
                      });
                    },
                    child: Text(
                      "Food",
                      style: TextStyle(
                        color: (act1) ? primaryColor : blackShade4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        act1 = false;
                        act2 = true;
                        act3 = false;
                        act4 = false;
                      });
                    },
                    child: Text(
                      "Fruits",
                      style: TextStyle(
                        color: (act2) ? primaryColor : blackShade4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        act1 = false;
                        act2 = false;
                        act3 = true;
                        act4 = false;
                      });
                    },
                    child: Text(
                      "Vegetables",
                      style: TextStyle(
                        color: (act3) ? primaryColor : blackShade4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        act1 = false;
                        act2 = false;
                        act3 = false;
                        act4 = true;
                      });
                    },
                    child: Text(
                      "Grocery",
                      style: TextStyle(
                        color: (act4) ? primaryColor : blackShade4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 328,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (act1) ...[
                      Row(
                        children: [
                          productContainer(
                            id: 1,
                            context: context,
                            image: "assets/images/food1.png",
                            name: "Avodaka Salad",
                            price: 20,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[0]);
                            },
                            plusButtonPressed: () {
                              log("plus Tapped");
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[0]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          productContainer(
                            id: 2,
                            context: context,
                            image: "assets/images/food2.png",
                            name: "Monsoon Salad",
                            price: 15,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[1]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[1]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          productContainer(
                            id: 3,
                            context: context,
                            image: "assets/images/food3.png",
                            name: "Basic Salad",
                            price: 10,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[2]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[2]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          productContainer(
                            id: 6,
                            context: context,
                            image: "assets/images/food6.png",
                            name: "Fruits Salad",
                            price: 10,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[5]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[5]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          productContainer(
                            id: 5,
                            context: context,
                            image: "assets/images/food5.png",
                            name: "Loyal Salad",
                            price: 28,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[4]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[4]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          productContainer(
                            id: 4,
                            context: context,
                            image: "assets/images/food4.png",
                            name: "Royal Salad",
                            price: 25,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[3]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[3]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ] else if (act2) ...[
                      Row(
                        children: [
                          productContainer(
                            id: 7,
                            context: context,
                            image: "assets/images/fruit1.png",
                            name: "All Fruits",
                            price: 23,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[6]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[6]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          productContainer(
                            id: 8,
                            context: context,
                            image: "assets/images/fruit2.png",
                            name: "Mix Fruits",
                            price: 29,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[7]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[7]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          productContainer(
                            id: 9,
                            context: context,
                            image: "assets/images/fruit3.png",
                            name: "Unique Fruits",
                            price: 40,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[8]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[8]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ] else if (act4) ...[
                      Row(
                        children: [
                          productContainer(
                            id: 10,
                            context: context,
                            image: "assets/images/gro1.png",
                            name: "All Grocery",
                            price: 100,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[9]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[9]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          productContainer(
                            id: 11,
                            context: context,
                            image: "assets/images/gro2.png",
                            name: "Mix Grocery",
                            price: 120,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[10]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[10]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          productContainer(
                            id: 12,
                            context: context,
                            image: "assets/images/gro3.png",
                            name: "Basic Grocery",
                            price: 150,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[11]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[11]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          productContainer(
                            id: 13,
                            context: context,
                            image: "assets/images/gro4.png",
                            name: "Crude Grocery",
                            price: 220,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[12]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[12]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ] else ...[
                      Row(
                        children: [
                          productContainer(
                            id: 14,
                            context: context,
                            image: "assets/images/veg2.png",
                            name: "All Veges",
                            price: 420,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[13]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[13]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          productContainer(
                            id: 15,
                            context: context,
                            image: "assets/images/veg3.png",
                            name: "Mix Veges",
                            price: 580,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page", arguments: products[14]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: products[14]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
