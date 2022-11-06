import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_ordering_system/modals/product.dart';
import 'package:food_ordering_system/providers/product_db_controller.dart';
import 'package:food_ordering_system/utils/colours.dart';

import '../utils/globals.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  initDataBase() async {
    await ProductDBHelper.productDBHelper.deleteAllData();
    for (Product product in products) {
      int success = await ProductDBHelper.productDBHelper.insertData(data: product);
      log(success.toString(), name: "success");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              "assets/images/food1.png",
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Fast delivery at\nyour doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Home delivery and online reservation\nsystem for restaurants & cafe",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Ink(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Let's Explore",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
