import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/admin_side/order_card.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';

class AdminTrackOrderScreen extends StatelessWidget {
  AdminTrackOrderScreen(
      {super.key, required this.order, required this.DeliveryProcess});
  final OrderModel order;
  final int DeliveryProcess;
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText("Order Placed",
          textStyle: TextStyle(color: Colors.green[800])),
      subtitle: StepperText("Your order has been placed",
          textStyle: const TextStyle(color: Colors.black)),
    ),
    StepperData(
      title:
          StepperText("Packed", textStyle: TextStyle(color: Colors.green[800])),
      subtitle: StepperText("Your order is being prepared",
          textStyle: const TextStyle(color: Colors.black)),
    ),
    StepperData(
      title: StepperText("Out for Delivery",
          textStyle: TextStyle(color: Colors.green[800])),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver\nyour item",
          textStyle: const TextStyle(color: Colors.black)),
    ),
    StepperData(
        title: StepperText("Delivered",
            textStyle: TextStyle(color: Colors.green[800]))),
  ];
  @override
  Widget build(BuildContext context) {
    log(DeliveryProcess.toString());
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 10),
                child: Text(
                  "Track order",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          OrderCard(order: order),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AnotherStepper(
              activeIndex: order.deleveryProcess,
              verticalGap: 50,
              inActiveBarColor: Colors.black,
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              activeBarColor: Colors.blue,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          int currentDeliveryProcess = order.deleveryProcess;

          await updateDeliveryStatus(order, currentDeliveryProcess + 1);
          // Utils.customSnackbar(
          //     context: context,
          //     text: "Delivery status updated",
          //     type: AnimatedSnackBarType.success);
          // Navigator.pop(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
