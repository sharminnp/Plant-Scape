import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/domain/wishlist.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/plantdetails/plant_screen.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';

class FlowerPageView extends StatelessWidget {
  const FlowerPageView({
    Key? key,
    required this.plantColor,
  }) : super(key: key);

  final List<Color?> plantColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Flowers"),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went Wrong!!");
            } else if (snapshot.hasData) {
              List<ProductModel> flowersList = [];
              final productList = snapshot.data;
              for (var product in productList!) {
                if (product.category == 'Flowers') {
                  flowersList.add(product);
                }
              }
              return Container(
                child: (flowersList.isEmpty)
                    ? Center(child: Text("No Flowers Added"))
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            itemCount: flowersList.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 4,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 10),
                            itemBuilder: (ctx, index) {
                              final flowers = flowersList[index];
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlantScreen(product: flowers)));
                                  },
                                  // child: Container(
                                  //height: 900,
                                  //
                                  // color: Colors.red,
                                  //width: double.infinity,
                                  child: Positioned(
                                    bottom: 0,
                                    left: 10,
                                    right: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: plantColor[index],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 150,
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.network(
                                              flowers.image,
                                              //sfit: BoxFit.contain,
                                              width: double.infinity,
                                              height: 127,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Text(flowers.name)),
                                                StreamBuilder(
                                                    stream: getAllWishlist(),
                                                    builder:
                                                        (context, snapshot) {
                                                      final wishlist =
                                                          snapshot.data!;
                                                      return IconButton(
                                                          onPressed: () async {
                                                            if (wishlist
                                                                .where((element) =>
                                                                    (element.name +
                                                                        element
                                                                            .category) ==
                                                                    (flowers.name +
                                                                        flowers
                                                                            .category))
                                                                .isEmpty) {
                                                              await addToWishlist(
                                                                  product:
                                                                      flowers);
                                                              Utils.customSnackbar(
                                                                  context:
                                                                      context,
                                                                  text:
                                                                      "Item added to wishlist",
                                                                  type: AnimatedSnackBarType
                                                                      .success);
                                                            } else {
                                                              await removeFromWishlist(
                                                                  flowers);
                                                              Utils.customSnackbar(
                                                                  context:
                                                                      context,
                                                                  text:
                                                                      "Item removed to wishlist",
                                                                  type: AnimatedSnackBarType
                                                                      .warning);
                                                            }
                                                          },
                                                          icon: Icon(wishlist
                                                                  .where((element) =>
                                                                      (element.name +
                                                                          element
                                                                              .category) ==
                                                                      (flowers.name +
                                                                          flowers
                                                                              .category))
                                                                  .isEmpty
                                                              ? Icons
                                                                  .favorite_border
                                                              : Icons
                                                                  .favorite));
                                                    })
                                              ],
                                            ),
                                            Text(flowers.price.toString())
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  //),
                                  );
                            }),
                      ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
