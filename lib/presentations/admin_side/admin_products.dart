import 'package:flutter/material.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/presentations/admin_side/Admin_plant.dart';
import 'package:plant_app/presentations/admin_side/admin_add_products.dart';

class AdminProducts extends StatelessWidget {
  const AdminProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: StreamBuilder(
            stream: getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Something Went Wrong!"));
              } else if (snapshot.hasData) {
                final productList = snapshot.data;
                return (productList!.isEmpty)
                    ? Text("Oops List is Empty!")
                    : ListView.builder(
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          final product = productList[index];
                          return AdminProductWidget(product: product);
                        },
                      );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddProducts(),
            ),
          );
        },
      ),
    );
  }
}

class AdminProductWidget extends StatelessWidget {
  const AdminProductWidget({
    required this.product,
    Key? key,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AdminPlantScreen(
                    product: product,
                  )));
        },
        child: Container(
          height: 120,
          width: 380,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      height: 120,
                      width: 150,
                      child: Image.network(product.image)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        product.price.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      ),
                      IconButton(
                          onPressed: () {
                            deleteProduct(
                                name: product.name, category: product.category);
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
