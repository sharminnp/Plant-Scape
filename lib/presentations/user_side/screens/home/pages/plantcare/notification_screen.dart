import 'package:flutter/material.dart';

import 'package:plant_app/presentations/user_side/screens/home/pages/main_Screen.dart';

class NotificationSCreen extends StatelessWidget {
  const NotificationSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 350, top: 15),
              child: IconButton(
                  iconSize: 30,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  icon: Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 180),
              child: Text(
                "Keep your\nPlants\nAlive",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                "Are the plants you love the ones you can have?\nOur #1 rule of (green) thumb is to determine\nthe amount of natural lightyour space receives,\nand to choose your plant accordingly. If you\nare not sure just by looking, start by figuring out which direction your windows face.",
                style: TextStyle(
                  fontSize: 15,
                  // fontWeight: FontWeight.bold,
                  // color: Colors.green[800]
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                      // color: Colors.black,
                      height: 200,
                      width: 180,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              // topRight: Radius.circular(120),
                              bottomRight: Radius.circular(180)),
                          child:
                              Image.asset("assets/images/waterpouring2.jpg"))),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "​Be mindful\nwhen watering",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      ),
                      Text(
                        "It’s better to under water\nyour plants than to\noverwater.Too much water\ncan lead to root rot.\nDitch your watering\nschedule and water your\nplant only when it needs.",
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          // color: Colors.green[800]
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "​​Always keep\ntemperatures\nstable",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Keep​ ​your​ ​plant’s​ ​home\nenvironment as stable as\npossible. Extreme changes\ncan stress plants out",
                          style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            // color: Colors.green[800]
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 200,
                    width: 170,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            // topRight: Radius.circular(120),
                            topLeft: Radius.circular(150)),
                        child: Image.asset("assets/images/plantcare2.jpg")))
              ],
            ),
            Image.asset("assets/images/plaantcare3.jpg"),
            //Image.asset("assets/images/plantcare6.jpg")
          ],
        ),
      ),
    );
  }
}
