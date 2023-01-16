import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            completed(context,
                colorsgreen: Colors.green.shade800, tetxs: 'Leave a review'),
            completed(context,
                colorsgreen: Colors.green.shade800, tetxs: 'Leave a review'),
            completed(context,
                colorsgreen: Colors.green.shade800, tetxs: 'Leave a review'),
            completed(context,
                colorsgreen: Colors.green.shade800, tetxs: 'Leave a review')
          ],
        ),
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
              )
              //kHeight10,
              //text('Leave a Review'),
              // kHeight10,
              // kDividerGrey,
              // kHeight10,
              // OrderMainCard(
              //   deliveryType: '',
              //   onTap: () {},
              //   orderType: '',
              //   isVisible: false,
              // ),
              // kHeight10,
              // kDividerGrey,
              // kHeight10,
              // CommonHeading(text: 'How is your order'),
              // kHeight10,
              // text('Please give your rating & also your review..'),
              // kHeight10,
              ,
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
              // kHeight10,
              // CustomTextField(
              //   hintText: 'Review',
              //   icon: Icons.reviews,
              // ),
              // kHeight10,
              // kDividerGrey,
              // kHeight10,
              // Row(
              //   children: [
              //     Expanded(
              //       child: CommonButton(
              //         buttonText: 'Cancel',
              //         onPressed: () {},
              //         bgColor: kSpecialGrey,
              //       ),
              //     ),
              //     kWidth10,
              //     Expanded(
              //       child: CommonButton(
              //         buttonText: 'Submit',
              //         onPressed: () {},
              //         bgColor: kWhite,
              //       ),
              //     ),
              //   ],
              // ),
              //kHeight25,
            ],
          ),
        );
      },
    );
  }

  completed(BuildContext context,
      {required String tetxs, required Color colorsgreen}) {
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
                          padding: const EdgeInsets.only(left: 7, top: 3),
                          child: Text("Completed"),
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
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          child: Text(
                            "500",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: GestureDetector(
                            onTap: () {
                              leaveReview(context);
                            },
                            child: Container(
                              height: 25,
                              width: 110,
                              decoration: BoxDecoration(
                                  color: colorsgreen,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 3, left: 5),
                                child: Text(
                                  tetxs,
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
}
