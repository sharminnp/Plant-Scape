import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_app/presentations/admin_side/navbar_screen.dart';
import 'package:plant_app/presentations/screens/introSceens/introScreen1.dart';

class IntroScreenMain extends StatelessWidget {
  const IntroScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    // navigateTontroHome(context);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/aluvera_plant-removebg-preview.png",
                height: 800,
                width: 800,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 500, left: 20),
                child: Column(
                  children: [
                    Text(
                      "welcome to 👋",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Plantscape",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.green[800],
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 600, left: 20),
                child: Text(
                    "The best plant e-commerce & online store app of\nthe century for your needs"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 765, left: 290),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => IntroScreenOne()));
                  },
                  // IntroScreenOne()
                  //AdminScreen()
                  child: Container(
                    height: 30,
                    width: 80,
                    child: Text(
                      "Lets Go",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[800],
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
