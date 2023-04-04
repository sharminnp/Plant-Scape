import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/domain/wishlist.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/plantdetails/plant_screen.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';

class MiniPlantPageView extends StatelessWidget {
  const MiniPlantPageView({
    Key? key,
    required this.plantColor,
  }) : super(key: key);

  final List<Color?> plantColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Mini Plants"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something Went Wrong!");
            } else if (snapshot.hasData) {
              List<ProductModel> miniPlantList = [];
              final productList = snapshot.data;
              for (var product in productList!) {
                if (product.category == 'Miniplants') {
                  miniPlantList.add(product);
                }
              }
              return Container(
                child: (miniPlantList.isEmpty)
                    ? Center(child: Text("No MiniPlants Added"))
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: ListView.separated(
                          itemCount: miniPlantList.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },

                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            log(miniPlantList.length.toString());
                            final miniplant = miniPlantList[index];
                            log(miniplant.name);
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        PlantScreen(product: miniplant)));
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: plantColor[index],
                                      borderRadius: BorderRadius.circular(20)),
                                  width: double.infinity,
                                  height: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Image.network(
                                          miniplant.image,
                                          width: 110,
                                          // height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        // mainAxisAlignment:
                                        //  MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 40),
                                            child: Text(
                                              miniplant.name,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(miniplant.price.toString())
                                        ],
                                      ),
                                      StreamBuilder(
                                          stream: getAllWishlist(),
                                          builder: (context, snapshot) {
                                            final wishlist = snapshot.data!;

                                            return IconButton(
                                                onPressed: () async {
                                                  if (wishlist
                                                      .where((element) =>
                                                          (element.name +
                                                              element
                                                                  .category) ==
                                                          (miniplant.name +
                                                              miniplant
                                                                  .category))
                                                      .isEmpty) {
                                                    await addToWishlist(
                                                        product: miniplant);
                                                    Utils.customSnackbar(
                                                        context: context,
                                                        text:
                                                            "Item removed to wishlist",
                                                        type:
                                                            AnimatedSnackBarType
                                                                .warning);
                                                  } else {
                                                    await removeFromWishlist(
                                                        miniplant);
                                                    Utils.customSnackbar(
                                                        context: context,
                                                        text:
                                                            "Item removed to wishlist",
                                                        type:
                                                            AnimatedSnackBarType
                                                                .warning);
                                                  }
                                                },
                                                icon: Icon(wishlist
                                                        .where((element) =>
                                                            (element.name +
                                                                element
                                                                    .category) ==
                                                            (miniplant.name +
                                                                miniplant
                                                                    .category))
                                                        .isEmpty
                                                    ? Icons.favorite_border
                                                    : Icons.favorite));
                                          })
                                    ],
                                  )),
                            );
                          },

                          // itemCount: miniPlantList.length
                        ),
                      ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
