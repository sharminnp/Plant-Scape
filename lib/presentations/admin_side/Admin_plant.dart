import 'package:flutter/material.dart';
import 'package:plant_app/domain/product_model.dart';
import 'package:plant_app/presentations/admin_side/admin_products.dart';

class AdminPlantScreen extends StatelessWidget {
  const AdminPlantScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 350, top: 15),
            child: IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AdminProducts()));
                },
                icon: Icon(Icons.arrow_back)),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: Container(
              height: 300,
              width: 400,
              color: Colors.grey,
            ),
          ),
          Text(
            "Plant name : ${product.name}",
            style: TextStyle(
                color: Colors.green[800],
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
            child: Text("About: ${product.about}"),
          ),
          Text(
            "price : ${product.price}",
            style: TextStyle(
                color: Colors.green[800],
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
