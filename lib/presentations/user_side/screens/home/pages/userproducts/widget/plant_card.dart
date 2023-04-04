import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/domain/wishlist.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/plantdetails/plant_screen.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';

class PlantGridCard extends StatelessWidget {
  const PlantGridCard({
    super.key,
    required this.plant,
  });

  final ProductModel plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlantScreen(product: plant)));
      },
      child: Stack(
        children: [
          Container(
            height: 900,
            //
            //color: Colors.red,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              height: 120,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            plant.name,
                            // maxLines: 1,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        StreamBuilder(
                          stream: getAllWishlist(),
                          builder: (context, snapshot) {
                            final whishlist = snapshot.data!;

                            return IconButton(
                              onPressed: () async {
                                if (whishlist
                                    .where((element) =>
                                        (element.name + element.category) ==
                                        (plant.name + plant.category))
                                    .isEmpty) {
                                  await addToWishlist(product: plant);

                                  Utils.customSnackbar(
                                      context: context,
                                      text: "Item Added to wishlist",
                                      type: AnimatedSnackBarType.success);
                                  log("Added to Whishlist");
                                } else {
                                  await removeFromWishlist(plant);
                                  Utils.customSnackbar(
                                      context: context,
                                      text: "Item removed to wishlist",
                                      type: AnimatedSnackBarType.warning);
                                  log("remove to Whishlist");
                                }
                              },
                              icon: Icon(
                                whishlist
                                        .where((element) =>
                                            (element.name + element.category) ==
                                            (plant.name + plant.category))
                                        .isEmpty
                                    ? Icons.favorite_border
                                    : Icons.favorite,
                                color: Colors.green[800],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 100),
                    child: Text(plant.price.toString()),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Image.network(
                  plant.image,
                  // width: 200,
                  height: 800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
