import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/address_model.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/text_field.dart';

class AddLocation extends StatelessWidget {
  AddLocation({super.key});
  final addressTypeController = TextEditingController();
  final placeController = TextEditingController();
  final subLocalityController = TextEditingController();
  final localityController = TextEditingController();
  final pincodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> addAddress({
    required String addressType,
    required String place,
    required String sublocality,
    required String locality,
    required String pincode,
    required BuildContext context,
  }) async {
    final adressDetail = "$place, $sublocality, $locality, $pincode";
    await addNewAddress(
      addressType: addressType,
      addressDetails: adressDetail,
    );

    Navigator.of(context).pop();
    Utils.customSnackbar(
        context: context,
        text: "Address Added",
        type: AnimatedSnackBarType.success);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight20,
                  Text(
                    "Address Type",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                  ),
                  kHeight10,
                  textFieldWidget(
                    validator: (value) {
                      if (value != null && value.length < 4) {
                        return "Enter valid Address type";
                      }
                    },
                    hintText: 'House , Office ...',
                    Icons: Icons.place,
                    controller: addressTypeController,
                  ),
                  kHeight20,
                  Text(
                    "Place",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                  ),
                  kHeight10,
                  textFieldWidget(
                    validator: (value) {
                      if (value != null && value.length < 4) {
                        return "Enter valid place";
                      }
                    },
                    hintText: "Ernakulam",
                    Icons: Icons.place,
                    controller: placeController,
                  ),
                  kHeight20,
                  Text(
                    "Sublocality",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                  ),
                  kHeight10,
                  textFieldWidget(
                    validator: (value) {
                      if (value != null && value.length < 4) {
                        return "Enter valid Sub locality";
                      }
                    },
                    hintText: "Plarivattom",
                    Icons: Icons.place,
                    maxline: 2,
                    controller: subLocalityController,
                  ),
                  kHeight20,
                  Text(
                    "Locality",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                  ),
                  kHeight10,
                  textFieldWidget(
                    validator: (value) {
                      if (value != null && value.length < 4) {
                        return "Enter valid Locality";
                      }
                    },
                    hintText: "Near Shopping mall",
                    Icons: Icons.place,
                    maxline: 3,
                    controller: localityController,
                  ),
                  kHeight20,
                  Text(
                    "Pin code",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                  ),
                  kHeight10,
                  textFieldWidget(
                    validator: (value) {
                      if (value != null && value.length < 4) {
                        return "Enter valid Pincode";
                      }
                    },
                    hintText: "789123",
                    Icons: Icons.place,
                    keyboardType: TextInputType.number,
                    controller: pincodeController,
                  ),
                  kHeight20,
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          } else {
                            addAddress(
                              addressType: addressTypeController.text.trim(),
                              place: placeController.text.trim(),
                              sublocality: subLocalityController.text.trim(),
                              locality: localityController.text.trim(),
                              pincode: pincodeController.text.trim(),
                              context: context,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[800],
                          shape: const StadiumBorder(),
                        ),
                        child: const Text("Add Location")),
                  ),
                  kHeight20
                ],
              ),
            ),
          ),
        ));
  }
}
