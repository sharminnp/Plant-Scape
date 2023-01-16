import 'package:flutter/material.dart';
import 'package:plant_app/domain/cart_model.dart';

class CartWidget extends StatelessWidget {
  CartWidget({
    Key? key,
    required this.cart,
  }) : super(key: key);
  CartModel cart;
  int totalAMount = 0;
  @override
  Widget build(BuildContext context) {
    totalAMount = totalAMount + (cart.price * cart.quantity);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: 380,
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
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "$totalAMount",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    // IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Icons.favorite,
                    //       color: Colors.green[800],
                    //     )),
                    IconButton(
                        onPressed: () async {
                          await delteFromCart(
                              name: cart.name, category: cart.category);
                        },
                        icon: Icon(
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final Newquantity = cart.quantity - 1;
                                if (Newquantity == 0) {
                                  await delteFromCart(
                                      name: cart.name, category: cart.category);
                                } else {
                                  updateCartQuantity(
                                      cart: cart, quantity: Newquantity);
                                }
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ),
                            Text(
                              cart.quantity.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            GestureDetector(
                              onTap: () async {
                                int Newquantity = cart.quantity + 1;

                                await updateCartQuantity(
                                    cart: cart, quantity: Newquantity);
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
