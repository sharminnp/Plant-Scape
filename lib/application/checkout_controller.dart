import 'package:get/get.dart';
import 'package:plant_app/domain/address_model.dart';
import 'package:plant_app/domain/promo_code_model.dart';

class CheckoutController extends GetxController {
  RxList<AddressModel> userAddressList = <AddressModel>[].obs;
  RxInt selectedAddressValue = 0.obs;
  RxList<PromoCodeModel> promoCodeList = <PromoCodeModel>[].obs;
  RxInt selectedPromoCodeValue = 0.obs;

  @override
  void onInit() {
    userAddressList.bindStream(getAllAddress());
    promoCodeList.bindStream(getPromoCode());
    super.onInit();
  }
}
