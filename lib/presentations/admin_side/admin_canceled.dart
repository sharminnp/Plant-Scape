import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/admin_side/order_card.dart';

class AdminCanceled extends StatelessWidget {
  const AdminCanceled({super.key});

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
            List<OrderModel> canceledOrderList = [];
            for (var order in orderList) {
              if (order.isCancelled == true) {
                canceledOrderList.add(order);
              }
            }
            return canceledOrderList.isEmpty
                ? Center(
                    child: Text("No completed orders"),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return kHeight10;
                    },
                    itemCount: canceledOrderList.length,
                    itemBuilder: (context, index) {
                      final order = canceledOrderList[index];
                      return OrderCard(
                        order: order,
                        isActive: false,
                      );
                    });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
