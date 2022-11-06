import 'package:food_ordering_system/views/intro_screen.dart';

import '../../views/home_screen/page/home_screen.dart';
import 'package:flutter/cupertino.dart';
import '../views/product_page.dart';
import 'appRoutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().homePage: (context) => const HomePage(),
  AppRoutes().introScreen: (context) => const IntroScreen(),
  AppRoutes().productPage: (context) => const ProductPage(),
};
