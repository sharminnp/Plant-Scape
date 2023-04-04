import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/domain/wishlist.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/plantdetails/plant_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/userproducts/widget/plant_card.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';

class PlantPageView extends StatelessWidget {
  const PlantPageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Plants"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something Went wrong!!");
            } else if (snapshot.hasData) {
              List<ProductModel> plantList = [];
              final productList = snapshot.data;
              for (var product in productList!) {
                if (product.category == 'Plants') {
                  plantList.add(product);
                }
              }
              return (plantList.isEmpty)
                  ? Text("No Plant Added")
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: plantList.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 1 / 1.3,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 10),
                      itemBuilder: (ctx, index) {
                        final plant = plantList[index];
                        return PlantGridCard(plant: plant);
                      });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
