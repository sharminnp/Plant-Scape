import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/constant/user_constant.dart';
import 'package:plant_app/domain/product_model.dart';


Future<void> whishlist(
    {required ProductModel product, required String whishlist}) async {
  final doc = FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Wishlist')
      .doc(product.name + product.category);

  final whishlist = ProductModel(
    category: product.category,
    name: product.name,
    about: product.about,
    price: product.price,
    image: product.image,
  );
}
