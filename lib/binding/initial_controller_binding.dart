import 'package:get/get.dart';
import 'package:plant_app/application/checkout_controller.dart';
import 'package:plant_app/application/payment_controller.dart';

class InitialControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CheckoutController>(CheckoutController(), permanent: true);
    Get.put<PaymentController>(PaymentController(), permanent: true);
  }
}
