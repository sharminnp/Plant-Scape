import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/presentations/screens/spalsh/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      home: SplashScreen(),
    );
  }
}
