import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxInt selectedValue = 0.obs;

  void buttonClick(int value) {
    selectedValue.value = value;
  }
}
