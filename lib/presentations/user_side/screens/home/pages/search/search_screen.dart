import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/application/search_controller.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/userproducts/widget/plant_card.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final searchController = Get.find<SearchController>();
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      searchController.onInitialSearch();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text("Search"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            kHeight20,
            TextField(
              onChanged: (value) {
                searchController.searchProduct(value);
              },
              maxLines: 1,
              style: const TextStyle(height: 1),
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 4, color: Colors.green.shade800)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.green.shade800, width: 4)),
                  hintText: "Search"),
            ),
            Expanded(
                child: Obx(() => searchController.searchList.isEmpty
                    ? Center(child: Text("No item found"))
                    : Obx(
                        () => GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: searchController.searchList.length,
                          itemBuilder: (context, index) {
                            final product = searchController.searchList[index];
                            return PlantGridCard(plant: product);
                          },
                        ),
                      ))),
          ],
        ),
      ),
    );
  }
}
