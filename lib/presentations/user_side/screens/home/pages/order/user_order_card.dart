import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/domain/order_model.dart';
import 'package:plant_app/presentations/admin_side/admin_track_order.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/order/track_order.dart';

class UserOrderCard extends StatelessWidget {
  const UserOrderCard(
      {super.key,
      required this.order,
      required this.isActive,
      required this.isCompleted});
  final bool isActive;
  final bool isCompleted;
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
                            builder: (context) => TrackOrderScreen(
                                  order: order,
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
                  : isCompleted
                      ? GestureDetector(
                          onTap: () {
                            leaveReview(context);
                          },
                          child: Container(
                            height: 25,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3, left: 5),
                              child: Text(
                                "leave a review",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  leaveReview(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        // var text;
        return Container(
          height: 400,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.green[800],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "leave a review",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,

                    //prefixIcon: Icon(Icons),
                    // fillColor: Colors.green,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "enter your review"),
              ),
              SizedBox(
                height: 160,
              ),
              RatingBar.builder(
                unratedColor: Colors.grey,
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
