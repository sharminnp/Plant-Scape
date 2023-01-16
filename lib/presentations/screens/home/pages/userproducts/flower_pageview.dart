import 'package:flutter/material.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/presentations/screens/home/pages/plantdetails/plant_screen.dart';

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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          PlantScreen(product: flowers)));
                                },
                                child: Container(
                                    height: 900,
                                    //
                                    //color: Colors.red,
                                    width: double.infinity,
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
                                        child: Column(
                                          children: [
                                            Image.network(
                                              flowers.image,
                                              //sfit: BoxFit.contain,
                                              width: 150,
                                              height: 127,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, left: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(flowers.name),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(Icons
                                                          .favorite_border))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 100),
                                              child: Text(
                                                  flowers.price.toString()),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
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
