import 'package:flutter/material.dart';
import 'package:plant_app/domain/cart_model.dart';

class CartWidget extends StatelessWidget {
  CartWidget({
    Key? key,
    required this.cart,
    this.isCart = true,
  }) : super(key: key);
  final CartModel cart;
  bool? isCart;
  int totalAMount = 0;
  @override
  Widget build(BuildContext context) {
    totalAMount = totalAMount + (cart.price * cart.quantity);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.only(right: 15),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //  color: Colors.black,
                    height: 120,
                    width: 100,
                    child: Image.network(cart.image)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$totalAMount",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800]),
                          ),
                          isCart == true
                              ? const SizedBox()
                              : Text(
                                  "Qty : ${cart.quantity}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                        ],
                      )
                    ],
                  ),
                ),
                isCart == true
                    ? Column(
                        children: [
                          IconButton(
                              onPressed: () async {
                                await delteFromCart(
                                    name: cart.name, category: cart.category);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.green,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 18, right: 10),
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      final newquantity = cart.quantity - 1;
                                      if (newquantity == 0) {
                                        await delteFromCart(
                                            name: cart.name,
                                            category: cart.category);
                                      } else {
                                        updateCartQuantity(
                                            cart: cart, quantity: newquantity);
                                      }
                                    },
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ),
                                  Text(
                                    cart.quantity.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      int Newquantity = cart.quantity + 1;

                                      await updateCartQuantity(
                                          cart: cart, quantity: Newquantity);
                                    },
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
