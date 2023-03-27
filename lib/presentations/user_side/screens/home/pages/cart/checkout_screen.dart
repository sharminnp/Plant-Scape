import 'package:flutter/material.dart';

import 'package:plant_app/presentations/user_side/screens/home/pages/cart/card_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/payment_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/address_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/profile/edit_profile.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/text_field.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Checkout"),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Shipping Adress",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 15),
              child: Container(
                height: 80,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: const Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Home",
                      style: TextStyle(
                          // fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  subtitle: const Text(
                    "Valiyaparamba kasragod 671312",
                    style: TextStyle(
                        // fontSize: 20,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AdressScreen()));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            Text(
              "Order List",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800]),
            ),
            cart(),
            cart(),
            cart(),
            Text(
              "Promo code",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800]),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: textFieldWidget(
                  hintText: "Enter promo code", Icons: Icons.add),
            ),
            Container(
              height: 110,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200]),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Amount",
                          style: TextStyle(
                              //fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Text("1500",
                            style: TextStyle(
                                //fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Promo",
                            style: TextStyle(
                                //fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const Text("30.0",
                            style: TextStyle(
                                //fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total",
                            style: TextStyle(
                                //fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const Text("1470",
                            style: TextStyle(
                                //fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PaymentScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 55,
                        top: 8,
                      ),
                      child: Text("Continue Payment",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.green[800],
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cart() {
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
                    Text(
                      "Rose",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "500",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 15),
                  child: Column(
                    children: [
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       Icons.favorite,
                      //       color: Colors.green[800],
                      //     )),
                      Container(
                        height: 20,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          " +1   -1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.green,
                          ))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
