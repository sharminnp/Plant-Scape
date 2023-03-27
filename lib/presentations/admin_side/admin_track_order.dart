import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/order/active_screen.dart';

class AdminTrackOrderScreen extends StatelessWidget {
  AdminTrackOrderScreen({super.key});
  List<StepperData> stepperData = [
    StepperData(
      title: StepperText("Order Placed",
          textStyle: TextStyle(color: Colors.green[800])),
      subtitle: StepperText("Your order has been placed",
          textStyle: TextStyle(color: Colors.black)),
    ),
    StepperData(
      title:
          StepperText("Packed", textStyle: TextStyle(color: Colors.green[800])),
      subtitle: StepperText("Your order is being prepared",
          textStyle: TextStyle(color: Colors.black)),
    ),
    StepperData(
      title: StepperText("Out for Delivery",
          textStyle: TextStyle(color: Colors.green[800])),
      subtitle: StepperText(
          "Our delivery executive is on the way to deliver\nyour item",
          textStyle: TextStyle(color: Colors.black)),
    ),
    StepperData(
        title: StepperText("Delivered",
            textStyle: TextStyle(color: Colors.green[800]))),
  ];
  @override
  Widget build(BuildContext context) {
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ActiveScreen()));
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
          active(context, colors: (Colors.transparent), text1: ''),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AnotherStepper(
              verticalGap: 50,
              inActiveBarColor: Colors.black,
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              activeBarColor: Colors.blue,
            ),
          ),
        ]),
      ),
    );
  }
}
