// import 'package:flutter/material.dart';
// import 'package:plant_app/domain/product_model.dart';
// import 'package:plant_app/presentations/screens/home/pages/userproducts/flower_pageview.dart';
// import 'package:plant_app/presentations/screens/home/pages/userproducts/miniplant_pageview.dart';
// import 'package:plant_app/presentations/screens/home/pages/userproducts/plant_pageview.dart';

// class ProductPageView extends StatelessWidget {
//   ProductPageView({
//     Key? key,
//     required PageController controller,
//     required this.plantImage,
//     required this.flowerList,
//     required this.plantColor,
//     required this.miniPlantImage,
//     required this.productList,
//   })  : _controller = controller,
//         super(key: key);

//   final PageController _controller;
//   final List<String> plantImage;
//   final List<String> flowerList;
//   final List<Color?> plantColor;
//   final List<String> miniPlantImage;
//   final List<ProductModel> productList;
//   List<ProductModel> plantsList = [];
//   List<ProductModel> flowersList = [];
//   List<ProductModel> miniPlantsList = [];

//   getProductsData() {
//     for (var product in productList) {
//       if (product.category == 'Plants') {
//         plantsList.add(product);
//       }
//       if (product.category == 'Flowers') {
//         flowersList.add(product);
//       }
//       if (product.category == 'Miniplants') {
//         miniPlantsList.add(product);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     getProductsData();
//     return Container(
//       height: 500,
//       child: PageView(
//         physics: ScrollPhysics(),
//         controller: _controller,
//         scrollDirection: Axis.horizontal,
//         children: [
//           PlantPageView(
//             plantImage: plantImage,
//             plantsList: plantsList,
//           ),
//           FlowerPageView(
//               flowerList: flowerList,
//               plantColor: plantColor,
//               flowersList: flowersList),
//           MiniPlantPageView(
//             plantColor: plantColor,
//             miniPlantImage: miniPlantImage,
//             miniPlantsList: miniPlantsList,
//           )
//         ],
//       ),
//     );
//   }
// }
