import 'package:get/get.dart';
import 'package:plant_app/domain/address_model.dart';

class AddressContoller extends GetxController {
  RxList<AddressModel> userAddressList = <AddressModel>[].obs;
  RxInt selectedValue = 0.obs;

  @override
  void onInit() {
    userAddressList.bindStream(getAllAddress());
    super.onInit();
  }
}
