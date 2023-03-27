import 'package:flutter/material.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/plantdetails/plant_screen.dart';

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
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PlantScreen(product: plant)));
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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 120,
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 50,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                plant.name,
                                                // maxLines: 1,
                                                // overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.favorite_border))
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
                      });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
