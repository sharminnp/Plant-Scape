import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/presentations/screens/home/pages/order/active_screen.dart';

class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({super.key});
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText("Order Placed",
          textStyle:
              TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
      subtitle: StepperText("Your order has been placed",
          textStyle: TextStyle(color: Colors.black)),
    ),
    StepperData(
      title: StepperText("Packed",
          textStyle:
              TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
      subtitle: StepperText("Your order is being prepared",
          textStyle: TextStyle(color: Colors.black)),
    ),
    StepperData(
      title: StepperText("Out for Delivery",
          textStyle:
              TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver\nyour item",
          textStyle: TextStyle(color: Colors.black)),
    ),
    StepperData(
        title: StepperText("Delivered",
            textStyle: TextStyle(
                color: Colors.green[800], fontWeight: FontWeight.bold))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Track order",
        ),
        backgroundColor: Colors.green[800],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            active(context, colors: (Colors.transparent), text1: ''),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: AnotherStepper(
                gap: 50,
                inActiveBarColor: Colors.black,
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                activeBarColor: Colors.blue,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
