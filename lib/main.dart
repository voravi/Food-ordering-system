import 'package:food_ordering_system/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '/utils/appRoutes.dart';
import '/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductController>(create: (context) => ProductController()),
      ],
      builder: (context,_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Astrology App",
        //home: HomePage(),
        initialRoute: AppRoutes().introScreen,
        routes: routes,
      ),
    );
  }
}
