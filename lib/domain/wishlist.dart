import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/constant/user_constant.dart';
import 'package:plant_app/domain/product_model.dart';

Future<void> addToWishlist({
  required ProductModel product,
}) async {
  final doc = FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Wishlist')
      .doc(product.name + product.category);

  final json = product.toJson();

  await doc.set(json);
}

Future<void> removeFromWishlist(ProductModel product) async {
  await FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Wishlist')
      .doc(product.name + product.category)
      .delete();
}

Stream<List<ProductModel>> getAllWishlist() {
  return FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Wishlist')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList());
}
