import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/application/checkout_controller.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/cart_model.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/payment_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/promo_code_user_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/widgets/address_card.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/widgets/cart_widget.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/widgets/promo_code_card.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/address_screen.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key, required this.cartList});
  final List<CartModel> cartList;

  int getCartAmount() {
    int totalAmount = 0;
    for (var item in cartList) {
      totalAmount = totalAmount + item.price;
    }
    return totalAmount;
  }

  int getTotalCartPrice() {
    int amount = getCartAmount();
    int discount = checkoutController.promoCodeList.isEmpty
        ? 0
        : checkoutController
            .promoCodeList[checkoutController.selectedPromoCodeValue.value]
            .discountPrice;
    return amount - discount;
  }

  final checkoutController = Get.find<CheckoutController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Checkout"),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shipping Adress",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
              kHeight10,
              Obx(
                () => checkoutController.userAddressList.isEmpty
                    ? Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("No Shipping Address"),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AddressScreen()));
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                      )
                    : AddressCard(
                        title: checkoutController
                            .userAddressList[
                                checkoutController.selectedAddressValue.value]
                            .addressType,
                        subtitle: checkoutController
                            .userAddressList[
                                checkoutController.selectedAddressValue.value]
                            .addressDetails,
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddressScreen()));
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ),
              ),
              kHeight10,
              Text(
                "Order List",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
              ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final cart = cartList[index];

                    return CartWidget(
                      cart: cart,
                      isCart: false,
                    );
                  }),
              Text(
                "Promo code",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
              kHeight10,
              Obx(() => checkoutController.promoCodeList.isEmpty
                  ? ListTile(
                      iconColor: Colors.black,
                      textColor: Colors.black,
                      title: Text("No promo code selected"),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PromoCodeUserScreen()));
                          },
                          icon: Icon(
                            Icons.add,
                          )),
                    )
                  : PromoCodeCard(
                      title: checkoutController
                          .promoCodeList[
                              checkoutController.selectedPromoCodeValue.value]
                          .discountName,
                      subtitle: checkoutController
                          .promoCodeList[
                              checkoutController.selectedPromoCodeValue.value]
                          .discountPrice
                          .toString(),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PromoCodeUserScreen()));
                          },
                          icon: Icon(Icons.edit)))),
              kHeight20,
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Obx(
                      () => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Amount",
                                style: TextStyle(
                                    //fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text("${getCartAmount()}",
                                  style: TextStyle(
                                      //fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Promo",
                                  style: TextStyle(
                                      //fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text(
                                  checkoutController.promoCodeList.isEmpty
                                      ? "-"
                                      : checkoutController
                                          .promoCodeList[checkoutController
                                              .selectedPromoCodeValue.value]
                                          .discountPrice
                                          .toString(),
                                  style: const TextStyle(
                                      //fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total",
                                  style: TextStyle(
                                      //fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              Text("${getTotalCartPrice()}",
                                  style: const TextStyle(
                                      //fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ],
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: GestureDetector(
                  onTap: () {
                    if (checkoutController.userAddressList.isEmpty) {
                      Utils.customSnackbar(
                          context: context,
                          text: "Please select Address",
                          type: AnimatedSnackBarType.warning);
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                              address: checkoutController.userAddressList[
                                  checkoutController
                                      .selectedAddressValue.value],
                              totalprice: getTotalCartPrice(),
                              cartList: cartList),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text("Continue Payment",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
