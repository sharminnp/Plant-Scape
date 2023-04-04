import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/constant/user_constant.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/order/user_order_card.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getAllOrders(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          final orderList = snapshot.data!;
          List<OrderModel> orderCompletedList = [];
          for (var order in orderList) {
            if (order.email == userEmail) {
              if (order.isCompleted == true) {
                orderCompletedList.add(order);
              }
            }
          }
          return orderCompletedList.isEmpty
              ? const Center(child: Text("No compelted items"))
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final order = orderCompletedList[index];
                    return UserOrderCard(
                      order: order,
                      isActive: false,
                      isCompleted: true,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return kHeight10;
                  },
                  itemCount: orderCompletedList.length);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
