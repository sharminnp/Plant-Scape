import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/promo_code_model.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/text_field.dart';

class AddPromoCode extends StatelessWidget {
  AddPromoCode({super.key});
  final formKey = GlobalKey<FormState>();
  final discountNameController = TextEditingController();
  final discountPriceController = TextEditingController();

  Future<void> addPromo(
      {required String discountName,
      required int discountPrice,
      required BuildContext context}) async {
    final promoCode = PromoCodeModel(
      discountName: discountName,
      discountPrice: discountPrice,
    );

    await addPromoCode(promoCode: promoCode);
    Utils.customSnackbar(
      context: context,
      text: "Coupon added sucsessfully",
      type: AnimatedSnackBarType.success,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        elevation: 0,
        title: const Text("Add promo code"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              kHeight20,
              textFieldWidget(
                controller: discountNameController,
                hintText: "Discount Name",
                validator: (value) {
                  if (value != null && value.length < 3) {
                    return "Enter more than 3 characters";
                  } else {
                    return null;
                  }
                },
              ),
              kHeight20,
              textFieldWidget(
                controller: discountPriceController,
                keyboardType: TextInputType.number,
                hintText: "Discount Amount",
                validator: (value) {
                  if (value != null && value.length < 2) {
                    return "Enter Valid Price";
                  } else {
                    return null;
                  }
                },
              ),
              kHeight20,
              kHeight20,
              ElevatedButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  addPromo(
                    discountName: discountNameController.text.trim(),
                    discountPrice:
                        int.parse(discountPriceController.text.trim()),
                    context: context,
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800]),
                child: const Text("Add Discount"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
