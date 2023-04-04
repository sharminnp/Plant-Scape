import 'package:flutter/material.dart';
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
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          final orderList = snapshot.data!;
          List<OrderModel> activeOrderList = [];
          for (var order in orderList) {
            if (order.isCancelled == false && order.isCompleted == false) {
              activeOrderList.add(order);
            }
          }
          return activeOrderList.isEmpty
              ? Center(
                  child: Text("No active orders"),
                )
              : ListView.builder(
                  itemCount: activeOrderList.length,
                  itemBuilder: (context, index) {
                    final order = activeOrderList[index];

                    return OrderCard(
                      order: order,
                      isActive: true,
                    );
                  },
                );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
