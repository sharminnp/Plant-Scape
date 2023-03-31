import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/application/checkout_controller.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/address_model.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/widgets/address_card.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/add_address/add_location.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final checkoutController = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Address"),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => checkoutController.userAddressList.isEmpty
                  ? const Center(
                      child: Text("Address empty"),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return kHeight10;
                      },
                      shrinkWrap: true,
                      itemCount: checkoutController.userAddressList.length,
                      itemBuilder: (context, index) {
                        final address =
                            checkoutController.userAddressList[index];
                        return GestureDetector(
                          onLongPress: () {
                            deleteAddress(addressType: address.addressType);
                          },
                          child: AddressCard(
                              title: address.addressType,
                              subtitle: address.addressDetails,
                              trailing: Obx(
                                () => Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.green[800]!),
                                  value: index,
                                  groupValue: checkoutController
                                      .selectedAddressValue.value,
                                  onChanged: (value) {
                                    checkoutController
                                        .selectedAddressValue.value = value!;
                                  },
                                ),
                              )),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddLocation()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  shape: const StadiumBorder(),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Add Location",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  return ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: addressList.length,
//                     itemBuilder: (context, index) {
//                       final adress = addressList[index];
//                       return AddressCard(
//                         title: adress.addressType,
//                         subtitle: adress.addressDetails,
//                         trailing: Radio(
//                           fillColor: MaterialStateColor.resolveWith(
//                               (states) => Colors.green[800]!),
//                           value: adress.addressType,
//                           groupValue: selectedAddressValue,
//                           onChanged: (value) {},
//                         ),
//                       );
//                     },
//                   );