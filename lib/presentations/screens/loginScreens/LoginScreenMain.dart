import 'package:flutter/material.dart';
import 'package:plant_app/presentations/screens/loginScreens/createAcc.dart';
import 'package:plant_app/presentations/screens/loginScreens/sign_in_with_Password.dart';
import 'package:plant_app/presentations/screens/loginScreens/sign_in_with_google.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: Image.asset(
              "assets/images/shoping_plant-removebg-preview.png",
              height: 300,
            ),
          ),
          Text(
            "Let's You in",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: GestureDetector(
              onTap: () {
                SignInWIthGoogle.GoogleLogin();
              },
              child: Container(
                height: 40,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.g_mobiledata),
                    Text(
                      "Sign in with google",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              "or",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignInWithPassword()));
              },
              child: Container(
                height: 43,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.green[800],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in with Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 65, top: 30),
            child: Row(
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateAccount()));
                  },
                  child: Container(
                      height: 20,
                      width: 80,
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
