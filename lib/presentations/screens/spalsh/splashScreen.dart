import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plant_app/presentations/screens/introSceens/introScreenMain.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> navigateToHome(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => IntroScreenMain()));
  }

  @override
  Widget build(BuildContext context) {
    navigateToHome(context);
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 180),
            child: Image.asset(
              "assets/images/splashscreen_image-removebg-preview (1).png",
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(
            height: _mediaQuery.size.height * 0.5,
          ),
          SpinKitCircle(
            color: Colors.green,
            size: 70,
          )
        ],
      ),
    );
  }
}
