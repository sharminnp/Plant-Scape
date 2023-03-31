import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/application/checkout_controller.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/promo_code_model.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/widgets/promo_code_card.dart';

class PromoCodeUserScreen extends StatelessWidget {
  PromoCodeUserScreen({super.key});

  final checkoutController = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Obx(
              () => checkoutController.promoCodeList.isEmpty
                  ? const Center(
                      child: Text("No Discount's Available"),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return kHeight10;
                      },
                      itemCount: checkoutController.promoCodeList.length,
                      itemBuilder: (context, index) {
                        final promoCode =
                            checkoutController.promoCodeList[index];
                        return PromoCodeCard(
                          title: promoCode.discountName,
                          subtitle: promoCode.discountPrice.toString(),
                          trailing: Obx(
                            () => Radio(
                              value: index,
                              groupValue: checkoutController
                                  .selectedPromoCodeValue.value,
                              onChanged: (value) {
                                checkoutController
                                    .selectedPromoCodeValue.value = value!;
                              },
                            ),
                          ),
                        );
                      },
                    ),
            )));
  }
}
