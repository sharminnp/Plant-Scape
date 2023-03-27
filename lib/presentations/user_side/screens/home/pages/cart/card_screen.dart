import 'package:flutter/material.dart';
import 'package:plant_app/domain/cart_model.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/checkout_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/widgets/cart_widget.dart';

class CardScreen extends StatelessWidget {
  CardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("My cart"),
        backgroundColor: Colors.green[800],
      ),
      body: StreamBuilder(
          stream: getToCart(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Something Went Wrong!!"));
            } else if (snapshot.hasData) {
              final cartList = snapshot.data;
              int totalAmount = 0;

              for (var item in cartList!) {
                totalAmount = totalAmount + (item.price * item.quantity);
              }
              return (cartList.isEmpty)
                  ? const Text("cart is empty")
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: cartList.length,
                              itemBuilder: (context, index) {
                                final cart = cartList[index];
                                return CartWidget(
                                  cart: cart,
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              Text("Total Amount = $totalAmount",
                                  style: TextStyle(
                                      // color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const CheckoutScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 40, top: 8, bottom: 5),
                                      child: Text("Checkout",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    height: 40,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        color: Colors.green[800],
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
