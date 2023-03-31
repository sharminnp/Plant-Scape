import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/binding/initial_controller_binding.dart';
import 'package:plant_app/presentations/user_side/screens/spalsh/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

const loginKey = "isLogin";
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialControllerBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: const SplashScreen(),
    );
  }
}
