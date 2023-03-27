import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:plant_app/presentations/admin_side/navbar_screen.dart';
import 'package:plant_app/presentations/user_side/screens/home/homeScreen.dart';
import 'package:plant_app/presentations/user_side/screens/loginScreens/LoginScreenMain.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.email == "admin@gmail.com") {
            return const AdminScreen();
          } else {
            return const HomeScreen();
          }
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
