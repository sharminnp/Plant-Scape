import 'package:flutter/material.dart';
import 'package:plant_app/domain/cart_model.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/checkout_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/pages/cart/widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                  ? Center(child: const Text("Cart is empty"))
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Amount = $totalAmount",
                                  style: const TextStyle(
                                      // color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CheckoutScreen(
                                            cartList: cartList,
                                          )));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.green[800],
                                      borderRadius: BorderRadius.circular(30)),
                                  child: const Center(
                                    child: Text("Checkout",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
