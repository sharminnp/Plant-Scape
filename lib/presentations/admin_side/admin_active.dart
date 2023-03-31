import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/admin_side/order_card.dart';

class AdminActiveScreen extends StatelessWidget {
  const AdminActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getAllOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        } else if (snapshot.hasData) {
          final orderList = snapshot.data!;
          List<OrderModel> activeList = [];
          for (var order in orderList) {
            if (order.isCompleted == false) {
              activeList.add(order);
            }
          }

          return activeList.isEmpty
              ? Center(
                  child: Text("No orders"),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final order = activeList[index];
                    log("delery process${order.deleveryProcess}");
                    return OrderCard(order: order);
                  },
                  separatorBuilder: (context, index) {
                    return kHeight10;
                  },
                  itemCount: activeList.length);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
