import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_app/domain/cart_model.dart';
import 'package:plant_app/domain/product_model.dart';

import 'package:plant_app/presentations/screens/home/pages/main_Screen.dart';

class PlantScreen extends StatelessWidget {
  PlantScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 350, top: 15),
            child: IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                icon: Icon(Icons.arrow_back)),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 342),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 120, left: 120),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            IconButton(
                                color: Colors.white,
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("About",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              product.about,
                              style: TextStyle(
                                  fontSize: 15,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text("₹ ${product.price.toString()}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 50),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[900],
                              minimumSize: Size(300, 40),
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
                            child: Text("Add to cart")),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 400,
              //   width: double.infinity,
              //   // color: Colors.red,
              // ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 280,
                // top: ,,
                child: Image.network(
                  product.image,
                  height: mWidth,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
