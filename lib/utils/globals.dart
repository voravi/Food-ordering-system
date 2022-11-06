import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_system/providers/product_db_controller.dart';
import 'package:food_ordering_system/providers/product_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../modals/product.dart';
import 'colours.dart';

List<Product> products = [
  Product(
    id: 1,
    name: "Avodaka Salad",
    price: 20.0,
    image: "assets/images/food1.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 20.0,
  ),
  Product(
    id: 2,
    name: "Monsoon Salad",
    price: 15.0,
    image: "assets/images/food2.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 15.0,
  ),
  Product(
    id: 3,
    name: "Royal Salad",
    price: 25.0,
    image: "assets/images/food3.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 25.0,
  ),
  Product(
    id: 4,
    name: "Fruits Salad",
    price: 10.0,
    image: "assets/images/food4.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 10.0,
  ),
  Product(
    id: 5,
    name: "Loyal Salad",
    price: 28.0,
    image: "assets/images/food5.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 28.0,
  ),
  Product(
    id: 6,
    name: "Basic Salad",
    price: 10.0,
    image: "assets/images/food6.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 10.0,
  ),
  Product(
    id: 7,
    name: "All Fruits",
    price: 23.0,
    image: "assets/images/fruit1.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 23.0,
  ),
  Product(
    id: 8,
    name: "Mi Fruits",
    price: 29.0,
    image: "assets/images/fruit2.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 29.0,
  ),
  Product(
    id: 9,
    name: "Unique Fruits",
    price: 40.0,
    image: "assets/images/fruit3.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 40.0,
  ),
  Product(
    id: 10,
    name: "All Grocery",
    price: 100.0,
    image: "assets/images/gro1.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 100.0,
  ),
  Product(
    id: 11,
    name: "Mix Grocery",
    price: 120.0,
    image: "assets/images/gro2.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 120.0,
  ),
  Product(
    id: 12,
    name: "Basic Grocery",
    price: 150.0,
    image: "assets/images/gro3.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 150.0,
  ),
  Product(
    id: 13,
    name: "Crude Grocery",
    price: 220.0,
    image: "assets/images/gro4.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 220.0,
  ),
  Product(
    id: 14,
    name: "All Veges",
    price: 420.0,
    image: "assets/images/veg2.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 420.0,
  ),
  Product(
    id: 15,
    name: "Mix Veges",
    price: 580.0,
    image: "assets/images/veg3.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 580.0,
  ),
];

Widget productContainer(
    {required BuildContext context,
    required String image,
      required int id,
    required String name,
    required double price,
    required Function()? onTap,
    required Function()? plusButtonPressed}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          height: height * 0.33,
          width: width * 0.44,
          decoration: BoxDecoration(color: colorWhite, borderRadius: BorderRadius.circular(10), boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              offset: const Offset(0, 0),
              spreadRadius: 1,
              blurRadius: 10,
            )
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (height * 0.26) / 1.5,
                width: width * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          Provider.of<ProductController>(context,listen: false).likeProduct(product: products[id]);
                          log(products[id].isLike,name: "Is Like");
                          log(id.toString(),name: "Index");

                        },
                        icon: (products[id].isLike == "true")  ? Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.red,
                        ) : Icon(
                          Icons.favorite_border,
                          size: 25,
                          color: Color(0XFFBAC2CD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                  color: Color(0XFF1E2126),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "20min",
                    style: TextStyle(
                      color: Color(0XFFBAC2CD),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Color(0XFFffc107),
                      ),
                      Text(
                        "2.5",
                        style: TextStyle(
                          color: Color(0XFFBAC2CD),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$$price",
                    style: TextStyle(
                      color: Color(0XFF1E2126),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
        bottom: -60,
        right: -60,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: primaryColor,
          ),
          child: Align(
            alignment: Alignment(-1.1, -1.1),
            child: IconButton(
              onPressed: plusButtonPressed,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
