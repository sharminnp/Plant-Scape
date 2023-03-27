import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plant_app/main.dart';
import 'package:plant_app/presentations/user_side/screens/introSceens/introScreenMain.dart';
import 'package:plant_app/presentations/user_side/screens/loginScreens/authentication_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> navigateToIntroScreen(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    final isLogin = sharedprefs.getBool(loginKey);

    await Future.delayed(const Duration(seconds: 4));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) {
          if (isLogin == null || false) {
            return const IntroScreenMain();
          } else {
            return const AuthenticationScreen();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    navigateToIntroScreen(context);
    final screenHeight = MediaQuery.of(context).size.height;
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
            height: screenHeight * 0.5,
          ),
          const SpinKitCircle(
            color: Colors.green,
            size: 70,
          )
        ],
      ),
    );
  }
}
