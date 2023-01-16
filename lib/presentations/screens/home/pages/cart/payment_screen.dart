import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Payment",
        ),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Select a payment Method",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Payment(text: 'Pay Pal'),
            // SizedBox(
            //   height: 20,
            // ),
            Payment(text: 'Cash on delivery'),
            Padding(
              padding: const EdgeInsets.only(top: 500, left: 10, bottom: 10),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 55, top: 8),
                  child: Text("Confirm Payment",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(70)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Payment({required String text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green[800], borderRadius: BorderRadius.circular(20)),
        height: 60,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.circle_outlined,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
