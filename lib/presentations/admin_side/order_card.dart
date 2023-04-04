import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/admin_side/admin_track_order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order, required this.isActive});
  final bool isActive;
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Container(
              height: 120, width: 120, child: Image.network(order.orderImage)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.orderProductName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
              kHeight10,
              Text('Qty = ${order.quantity.toString()}'),
              kHeight10,
              Text(
                order.orderPrice.toString(),
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
              kHeight10,
              isActive
                  ? GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdminTrackOrderScreen(
                                  order: order,
                                  DeliveryProcess: order.deleveryProcess,
                                )));
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
                    )
                  : SizedBox()
            ],
          ),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Container(
    //     height: 120,
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //         color: Colors.white, borderRadius: BorderRadius.circular(30)),
    //     child: Row(
    //       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Container(
    //             color: Colors.black,
    //             height: 120,
    //             width: 150,
    //             child: Image.network(order.orderImage)),

    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             kHeight20,
    //             Text(
    //               order.orderProductName,
    //               style: TextStyle(
    //                   fontSize: 17,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.green[800]),
    //             ),
    //             kHeight10,
    //             Text("Qty = ${order.quantity}"),
    //             kHeight10,
    //             Text(
    //               "₹ ${order.orderPrice.toString()}",
    //               style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.green[800]),
    //             ),
    //             // SizedBox(
    //             //   height: 30,
    //             // ),
    //             // Container(
    //             //   height: 25,
    //             //   width: 90,
    //             //   child: Center(child: Text("in delivery")),
    //             //   decoration: BoxDecoration(
    //             //       color: Colors.grey[400],
    //             //       borderRadius: BorderRadius.circular(20)),
    //             // ),
    //           ],
    //         ),

    //         GestureDetector(
    //           onTap: () {
    //             Navigator.of(context).push(MaterialPageRoute(
    //                 builder: (context) => AdminTrackOrderScreen()));
    //           },
    //           child: Padding(
    //             padding: const EdgeInsets.only(left: 35, top: 25),
    //             child: Container(
    //               height: 25,
    //               width: 90,
    //               decoration: BoxDecoration(
    //                   color: Colors.green[800],
    //                   borderRadius: BorderRadius.circular(20)),
    //               child: Center(
    //                 child: Text(
    //                   "Track Order",
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         //
    //       ],
    //     ),
    //   ),
    // );
  }
}
//  GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => AdminTrackOrderScreen()));
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 35, top: 25),
//                 child: Container(
//                   height: 25,
//                   width: 90,
//                   decoration: BoxDecoration(
//                       color: Colors.green[800],
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Center(
//                     child: Text(
//                       "Track Order",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//             ),