import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:plant_app/presentations/screens/home/homeScreen.dart';
import 'package:plant_app/presentations/screens/loginScreens/LoginScreenMain.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext ctx) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
