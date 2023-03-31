import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/admin_side/order_card.dart';

class AdminCompletedScreen extends StatelessWidget {
  const AdminCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getAllOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final orderList = snapshot.data!;
            List<OrderModel> completedOrderList = [];
            for (var order in orderList) {
              if (order.isCompleted == true) {
                completedOrderList.add(order);
              }
            }
            return completedOrderList.isEmpty
                ? Center(
                    child: Text("No completed orders"),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: completedOrderList.length,
                    itemBuilder: (context, index) {
                      final order = completedOrderList[index];
                      return OrderCard(order: order);
                    });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
