import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String category;
  final String name;
  final String about;
  final int price;
  final String image;

  ProductModel({
    required this.category,
    required this.name,
    required this.about,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'about': about,
      'price': price,
      'image': image
    };
  }

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      category: json['category'],
      name: json['name'],
      about: json['about'],
      price: json['price'],
      image: json['image'],
    );
  }
}

Future<void> addProduct(
    {required String category,
    required String name,
    required String about,
    required int price,
    required String image}) async {
  final productDoc =
      FirebaseFirestore.instance.collection('Products').doc(name + category);

  final product = ProductModel(
      category: category, name: name, about: about, price: price, image: image);

  final json = product.toJson();
  await productDoc.set(json);
}

Future<void> deleteProduct(
    {required String name, required String category}) async {
  await FirebaseFirestore.instance
      .collection('Products')
      .doc(name + category)
      .delete();
}

Stream<List<ProductModel>> getAllProducts() {
  return FirebaseFirestore.instance.collection('Products').snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList());
}
