import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/order_model.dart';

import 'package:plant_app/presentations/user_side/screens/home/pages/order/track_order.dart';

class ActiveScreen extends StatelessWidget {
  ActiveScreen({
    super.key,
  });
  //final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Container(
          padding: EdgeInsets.only(top: 5),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            children: [
              // Container(
              //     height: 120,
              //     width: 120,
              //     child: Image.network(order.orderImage)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   order.orderProductName,
                  //   style: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.green[800]),
                  // ),
                  kHeight10,
                  // Text('Qty = ${order.quantity.toString()}'),
                  kHeight10,
                  // Text(
                  // //  order.orderPrice.toString(),
                  //   style: TextStyle(
                  //       fontSize: 17,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.green[800]),
                  // ),
                  kHeight10,
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TrackOrderScreen()));
                    },
                    child: Container(
                      height: 23,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Track Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

active(BuildContext context, {required String text1, required Color colors}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 120,
      width: 380,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  // color: Colors.black,
                  height: 120,
                  width: 150,
                  child: Image.asset(
                      "assets/images/flower2-removebg-preview.png")),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 140, top: 10),
                    child: Text(
                      "Rose",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150, top: 3),
                    child: Text("Qty=1"),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 115, top: 10),
                    child: Container(
                      height: 25,
                      width: 90,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 3),
                        child: Text("in delivery"),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          "500",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TrackOrderScreen()));
                          },
                          child: Container(
                            height: 25,
                            width: 90,
                            decoration: BoxDecoration(
                                color: colors,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3, left: 5),
                              child: Text(
                                text1,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //
            ],
          )
        ],
      ),
    ),
  );
}
