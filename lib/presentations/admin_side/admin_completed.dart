import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AdminCompletedScreen extends StatelessWidget {
  const AdminCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            completed(
              context,
            ),
            completed(
              context,
            ),
            completed(
              context,
            ),
            completed(
              context,
            )
          ],
        ),
      ),
    );
  }

  completed(
    BuildContext context,
  ) {
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
                          padding: const EdgeInsets.only(top: 7, right: 150),
                          child: Text(
                            "500",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
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
