import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/constant/user_constant.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/domain/wishlist.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(userEmail.toString());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Whishlist"),
          backgroundColor: Colors.green[800],
        ),
        backgroundColor: Colors.grey[200],
        body: StreamBuilder(
          stream: getAllWishlist(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              final wishlistList = snapshot.data!;

              return wishlistList.isEmpty
                  ? Center(child: Text("No Whishlist Items Added"))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final product = wishlistList[index];
                        return WishlistCard(
                          product: product,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return kHeight10;
                      },
                      itemCount: wishlistList.length);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              //
              children: [
                Container(
                    // color: Colors.black,
                    height: 120,
                    width: 120,
                    child: Image.network(product.image)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight20,
                    Text(
                      product.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]),
                    ),
                    kHeight20,
                    Text(
                      product.price.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]),
                    )
                  ],
                ),
              ],
            ),
            StreamBuilder(
                stream: getAllWishlist(),
                builder: (context, snapshot) {
                  return IconButton(
                      onPressed: () {
                        removeFromWishlist(product);
                        Utils.customSnackbar(
                            context: context,
                            text: "Item Removed from wishlist",
                            type: AnimatedSnackBarType.info);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.green[800],
                      ));
                })
          ],
        ),
      ),
    );
  }
}
