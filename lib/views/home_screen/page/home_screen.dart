import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_system/views/cart_page.dart';
import 'package:food_ordering_system/views/home_screen/page/ProductHomePage.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        items: [
          AnimatedBarItems(
              icon: const Icon(
                Icons.house_outlined,
                size: 28,
              ),
              selectedIcon: const Icon(Icons.house_rounded),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('Home')),
          AnimatedBarItems(
              icon: const Icon(Icons.mark_chat_read_outlined,size: 25,),
              selectedIcon: const Icon(Icons.mark_chat_read_outlined),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('Massage')),

          AnimatedBarItems(
              icon: const Icon(
                CupertinoIcons.cart,
                  size: 25,
              ),
              selectedIcon: const Icon(
                CupertinoIcons.cart,
              ),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('Cart')),
          AnimatedBarItems(
              icon: const Icon(
                CupertinoIcons.heart,
                size: 25,
              ),
              selectedIcon: const Icon(
                CupertinoIcons.heart_fill,
              ),
              selectedColor: Colors.green,
              backgroundColor: Colors.lightGreenAccent,
              title: const Text('Like')),
        ],
        iconSize: 32,
        barAnimation: BarAnimation.transform3D,
        iconStyle: IconStyle.animated,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        opacity: 0.3,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index!);
          setState(() {
            selected = index;
          });
        },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              heart = !heart;
            });
          },
          backgroundColor: Colors.white,
          child: Icon(
            heart ? CupertinoIcons.add_circled_solid : CupertinoIcons.add_circled,
            color: Colors.red,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          child: PageView(
            controller: controller,
            children: const [
              ProductHomePage(),
              Center(child: Text('Star')),
              CartPage(),
              Center(child: Text('Profile')),
              // Center(child: Text("Cart")),
            ],
          ),
        ),
    );
  }
}
