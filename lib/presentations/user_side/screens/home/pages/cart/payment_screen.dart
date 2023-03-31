import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/application/payment_controller.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/constant/user_constant.dart';
import 'package:plant_app/domain/address_model.dart';
import 'package:plant_app/domain/cart_model.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/user_side/screens/home/homeScreen.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen(
      {super.key,
      required this.address,
      required this.totalprice,
      required this.cartList});
  final AddressModel address;
  final int totalprice;
  final List<CartModel> cartList;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final paymentController = Get.find<PaymentController>();

  final _razorpay = Razorpay();

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onPaymentSuccess(context, 'Razor pay');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  void initRazorPay() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> onPaymentSuccess(
      BuildContext context, String paymentMethod) async {
    for (var item in widget.cartList) {
      final orderId = DateTime.now().millisecondsSinceEpoch;
      final order = OrderModel(
        orderId: "orderid$orderId",
        orderProductName: item.name,
        orderImage: item.image,
        orderPrice: item.price,
        quantity: item.quantity,
        address:
            "${widget.address.addressType} ${widget.address.addressDetails}",
        orderDate: DateTime.now().toString(),
        email: userEmail,
        paymentMethod: paymentMethod,
      );
      await createOrder(order);
      await delteFromCart(name: item.name, category: item.category);
    }
    Utils.customSnackbar(
      context: context,
      text: "Items Orderes Successfully",
      type: AnimatedSnackBarType.success,
    );
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    initRazorPay();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Payment",
        ),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 50,
            top: 20,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Select a payment Method",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    kHeight20,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(20)),
                      height: 60,
                      width: double.infinity,
                      child: ListTile(
                        title: const Text(
                          "Razor Pay",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Radio(
                          fillColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white,
                          ),
                          value: 0,
                          groupValue: paymentController.selectedValue.value,
                          onChanged: (value) {
                            paymentController.buttonClick(value!);
                          },
                        ),
                      ),
                    ),
                    kHeight20,
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(20)),
                      height: 60,
                      width: double.infinity,
                      child: ListTile(
                          title: const Text(
                            "Cash on delivery",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Radio(
                            fillColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white,
                            ),
                            value: 1,
                            groupValue: paymentController.selectedValue.value,
                            onChanged: (value) {
                              paymentController.buttonClick(value!);
                            },
                          )),
                    ),
                  ],
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (paymentController.selectedValue.value == 1) {
                        onPaymentSuccess(context, 'Cash on delevery');
                      } else {
                        var options = {
                          'key': 'rzp_test_mkzSidhb6RgmDG',
                          'amount': widget.totalprice * 100,
                          'name': 'Plantscape.',
                          'description': 'Demo',
                          'prefill': {
                            'contact': '9495885132',
                            'email': 'sharminnp123@gmail.com'
                          },
                          'external': {
                            'wallets': ['paytm']
                          }
                        };
                        _razorpay.open(options);
                      }
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(70)),
                      child: const Center(
                        child: Text("Confirm Payment",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
