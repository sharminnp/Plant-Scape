import 'package:flutter/material.dart';

class WhishlistScreen extends StatelessWidget {
  const WhishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Whishlist"),
        backgroundColor: Colors.green[800],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [whishlist(), whishlist(), whishlist(), whishlist()],
      ),
    );
  }

  Widget whishlist() {
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
                    SizedBox(
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
                  padding: const EdgeInsets.only(left: 120),
                  child: Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.green[800],
                          )),
                      IconButton(onPressed: () {}, icon: Icon(Icons.add))
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
