import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/constant/user_constant.dart';

class AddressModel {
  final String addressType;
  final String addressDetails;

  AddressModel({
    required this.addressType,
    required this.addressDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'addressType': addressType,
      'addressDetails': addressDetails,
    };
  }

  static AddressModel fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressDetails: json['addressDetails'],
      addressType: json['addressType'],
    );
  }
}

Future<void> addNewAddress({
  required String addressType,
  required String addressDetails,
}) async {
  final doc = FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Address')
      .doc(addressType);

  final addressModel = AddressModel(
    addressType: addressType,
    addressDetails: addressDetails,
  );

  final json = addressModel.toJson();
  await doc.set(json);
}

Stream<List<AddressModel>> getAllAddress() {
  return FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Address')
      .snapshots()
      .map((snapshots) => snapshots.docs
          .map(
            (doc) => AddressModel.fromJson(doc.data()),
          )
          .toList());

  // allAdress.forEach((element) {
  //   adressmodelList.add()
  //  });
}

Future deleteAddress({required String addressType}) async {
  await FirebaseFirestore.instance
      .collection('PlantScape')
      .doc('Users')
      .collection('Profile')
      .doc(userEmail)
      .collection('Address')
      .doc(addressType)
      .delete();
}
