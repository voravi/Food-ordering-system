import 'package:flutter/material.dart';
import 'package:food_ordering_system/providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../modals/product.dart';
import '../utils/colours.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> addedProducts = Provider.of<ProductController>(context).addedProduct;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                const Text(
                  " Cart Page",
                  style: TextStyle(color: blackShade2, fontSize: 19),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 470,
              width: double.infinity,
              child: ListView.builder(
                itemCount: addedProducts.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    tileColor: secondaryColor,
                    leading: Image.asset("${addedProducts[i].image}",height: 50,width: 50,),
                    title: Text(addedProducts[i].name),
                    subtitle: Text("Price: ${addedProducts[i].dummyPrice}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Provider.of<ProductController>(context, listen: false).addProduct(product: addedProducts[i]);
                            },
                            icon: const Icon(Icons.add,color: Colors.white,),
                          ),
                        ),
                        Text("   ${addedProducts[i].quantity}   "),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Provider.of<ProductController>(context, listen: false).removeProduct(product: addedProducts[i]);
                            },
                            icon: const Icon(Icons.remove,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Products: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("${Provider.of<ProductController>(context).totalProducts}",style: TextStyle(fontSize: 18,),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("\$${Provider.of<ProductController>(context).totalPrice}",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
