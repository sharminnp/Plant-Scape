import 'package:flutter/material.dart';
import 'package:plant_app/presentations/admin_side/navbar_screen.dart';
import 'package:plant_app/presentations/user_side/screens/loginScreens/LoginScreenMain.dart';
import 'package:plant_app/presentations/user_side/screens/loginScreens/authentication_screen.dart';

class IntroScreenOne extends StatefulWidget {
  const IntroScreenOne({super.key});

  @override
  State<IntroScreenOne> createState() => _IntroScreenOneState();
}

class _IntroScreenOneState extends State<IntroScreenOne> {
  int currentindex = 0;
  PageController? _controller;

  @override
  void initState() {
    // TODO: implement initState

    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller!.dispose();
    super.dispose();
  }

  List<String> currentImage = [
    "assets/images/plant_in_hand2-removebg-preview.png",
    "assets/images/plantinhand3.png",
    "assets/images/plantinhand4.png"
  ];
  List<String> currentText = [
    "We provide high quality\nplants for you",
    "Your satisfication is our\nnumber one priority",
    "Lets shop your favourite\nplant with plantscape Now!"
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: currentText.length,
              onPageChanged: (int index) {
                setState(() {
                  currentindex = index;
                });
              },
              // physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        currentImage[index],
                        height: screenHeight * 0.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        currentText[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
                //
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                        onPressed: () {
                          if (currentindex == currentText.length - 1) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AuthenticationScreen()));
                          }

                          _controller!.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceIn);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: Colors.green[800]),
                        child: Text(
                          currentindex != currentText.length - 1
                              ? "Next"
                              : 'Continue',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AuthenticationScreen()));
                    },
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          // color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        currentindex != currentText.length - 1 ? "Skip>>" : '',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
