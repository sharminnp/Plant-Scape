import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/presentations/user_side/screens/introSceens/intro_screen_one.dart';

class IntroScreenMain extends StatelessWidget {
  const IntroScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    // navigateTontroHome(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/aluvera_plant-removebg-preview.png",
                height: screenHeight,
                width: screenWidth,
              ),
              Positioned(
                bottom: 70,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
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
                    kHeight20,
                    Text(
                      "The best plant e-commerce & online store app of\nthe century for your needs",
                    ),
                    kHeight10,
                    SizedBox(
                      width: screenWidth - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const IntroScreenOne()));
                            },
                            child: Text(
                              "Lets Go",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
