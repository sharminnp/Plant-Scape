import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/constant/user_constant.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/admin_side/order_card.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/order/track_order.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/order/user_order_card.dart';

class ActiveScreen extends StatelessWidget {
  ActiveScreen({
    super.key,
  });
  //final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getAllOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (snapshot.hasData) {
          final orderList = snapshot.data!;
          List<OrderModel> activeOrderList = [];
          for (var order in orderList) {
            if (order.email == userEmail) {
              if (order.isCancelled == false && order.isCompleted == false) {
                activeOrderList.add(order);
              }
            }
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                final order = activeOrderList[index];
                return UserOrderCard(
                  order: order,
                  isActive: true,
                  isCompleted: false,
                );
              },
              separatorBuilder: (context, index) {
                return kHeight10;
              },
              itemCount: activeOrderList.length);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
