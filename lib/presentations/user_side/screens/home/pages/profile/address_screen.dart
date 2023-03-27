import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/application/address_controller.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/widgets/address_card.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/add_address/add_location.dart';

class AdressScreen extends StatelessWidget {
  AdressScreen({super.key});

  final addressContoller = Get.put<AddressContoller>(AddressContoller());
  String selectedAddressValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Address"),
        backgroundColor: Colors.green[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: addressContoller.userAddressList.length,
              itemBuilder: (context, index) {
                final adress = addressContoller.userAddressList[index];
                return AddressCard(
                  title: adress.addressType,
                  subtitle: adress.addressDetails,
                  trailing: Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Colors.green[800]!),
                    value: index,
                    groupValue: addressContoller.selectedValue.value,
                    onChanged: (value) {
                      addressContoller.selectedValue.value = value!;
                    },
                  ),
                );
              },
            );
          }),
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