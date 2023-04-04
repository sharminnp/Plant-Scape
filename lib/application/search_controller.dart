import 'dart:developer';

import 'package:get/get.dart';
import 'package:plant_app/domain/product_model.dart';

class SearchController extends GetxController {
  RxList<ProductModel> allProductList = <ProductModel>[].obs;
  RxList<ProductModel> searchList = <ProductModel>[].obs;

  @override
  void onInit() {
    allProductList.bindStream(getAllProducts());

    // searchList.assignAll(allProductList.value);
    searchList = RxList.from(allProductList);
    super.onInit();
  }

  void onInitialSearch() {
    log("on initialsearch called");
    searchList = RxList.from(allProductList);
    log(searchList.toString());
  }

  void searchProduct(String productName) {
    log("search product called");
    log(productName);
    searchList = allProductList
        .where((product) => product.name
            .toLowerCase()
            .contains(productName.toLowerCase().trim()))
        .toList()
        .obs;
    log(searchList.toString());
  }
}
