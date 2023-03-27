import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/constant/user_constant.dart';

class CartModel {
  final String category;
  final String name;
  final int price;
  final int quantity;
  final String image;

  CartModel(
      {required this.category,
      required this.image,
      required this.name,
      required this.price,
      required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'image': image,
      'name': name,
      'price': price,
      'quantity': quantity
    };
  }

  static CartModel fromJson(Map<String, dynamic> json) {
    return CartModel(
        category: json['category'],
        image: json['image'],
        name: json['name'],
        price: json['price'],
        quantity: json['quantity']);
  }
}

Future<void> addToCart(
    {required String category,
    required String image,
    required String name,
    required int price,
    required int quantity}) async {
  final cartDoc = FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Cart')
      .doc(name + category);
  final cart = CartModel(
      category: category,
      image: image,
      name: name,
      price: price,
      quantity: quantity);

  final json = cart.toJson();
  await cartDoc.set(json);
}

Stream<List<CartModel>> getToCart() {
  return FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Cart')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList());
}

Future<void> delteFromCart(
    {required String name, required String category}) async {
  FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Cart')
      .doc(name + category)
      .delete();
}

Future<void> updateCartQuantity(
    {required CartModel cart, required int quantity}) async {
  final cartDoc = FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Cart')
      .doc(cart.name + cart.category);
  final newCart = CartModel(
      category: cart.category,
      image: cart.image,
      name: cart.name,
      price: cart.price,
      quantity: quantity);

  final json = newCart.toJson();
  await cartDoc.update(json);
}
