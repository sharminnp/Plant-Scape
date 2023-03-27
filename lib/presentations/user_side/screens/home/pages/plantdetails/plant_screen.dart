import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/cart_model.dart';
import 'package:plant_app/domain/product_model.dart';

import 'package:plant_app/presentations/user_side/screens/home/pages/main_Screen.dart';

class PlantScreen extends StatelessWidget {
  PlantScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          iconSize: 30,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: screenHeight * 0.45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 35),
                          Text(
                            product.name,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("About",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            product.about,
                            style: const TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text("₹ ${product.price.toString()}",
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      kHeight20,
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[900],
                              minimumSize: const Size(300, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0)),
                            ),
                            onPressed: () {
                              addToCart(
                                  category: product.category,
                                  image: product.image,
                                  name: product.name,
                                  price: product.price,
                                  quantity: 1);
                              log("item added to cart");
                            },
                            child: const Text("Add to cart")),
                      ),
                      kHeight20,
                      kHeight20
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: screenHeight * 0.32,
              child: Image.network(
                product.image,
                height: screenWidth,
              ),
            )
          ],
        ),
      ),
    );
  }
}
