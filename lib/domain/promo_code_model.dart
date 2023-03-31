import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/domain/product_model.dart';

class PromoCodeModel {
  final String discountName;
  final int discountPrice;

  PromoCodeModel({
    required this.discountName,
    required this.discountPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'promoName': discountName,
      'discountPrice': discountPrice,
    };
  }

  static PromoCodeModel fromJson(Map<String, dynamic> json) {
    return PromoCodeModel(
      discountName: json['promoName'],
      discountPrice: json['discountPrice'],
    );
  }
}

Stream<List<PromoCodeModel>> getPromoCode() {
  return FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Admin')
      .collection('PromoCode')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => PromoCodeModel.fromJson(doc.data()))
          .toList());
}

Future<void> addPromoCode({required PromoCodeModel promoCode}) async {
  final doc = FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Admin')
      .collection('PromoCode')
      .doc(promoCode.discountName);

  final json = promoCode.toJson();

  await doc.set(json);
}

Future<void> deletePromoCode({required String discountName}) async {
  await FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Admin')
      .collection('PromoCode')
      .doc(discountName)
      .delete();
}
