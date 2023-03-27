import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constant/constants.dart';
import 'package:plant_app/main.dart';
import 'package:plant_app/presentations/user_side/screens/loginScreens/LoginScreenMain.dart';
import 'package:plant_app/presentations/user_side/screens/loginScreens/authentication_screen.dart';
import 'package:plant_app/presentations/user_side/screens/loginScreens/createAcc_profile.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formkey = GlobalKey<FormState>();
  final emialController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    icon: Icon(Icons.arrow_back)),
                kHeight20,
                Center(
                  child: Text(
                    "Plantscape",
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                kHeight10,
                Text(
                  "Create Your Account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                kHeight20,
                textFieldWidget(
                  hintText: "Enter your Name",
                  Icons: Icons.person,
                  validator: (value) {
                    if (value != null && value.length < 2) {
                      return 'Enter your name';
                    } else {
                      return null;
                    }
                  },
                ),
                kHeight20,
                textFieldWidget(
                  controller: emialController,
                  hintText: "E-mail",
                  Icons: Icons.email,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
                kHeight20,
                textFieldWidget(
                  obscureText: true,
                  controller: passwordController,
                  hintText: "Password",
                  Icons: Icons.password,
                  validator: (value) {
                    if (value != null && value.length < 7) {
                      return 'Enter min.7 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                kHeight20,
                textFieldWidget(
                  maxline: 1,
                  obscureText: false,
                  controller: conformPasswordController,
                  hintText: "Confirm Password",
                  Icons: Icons.password,
                  validator: (value) {
                    if (value != null && value.length < 7) {
                      return 'Enter min.7 characters';
                    } else if (passwordController.text !=
                        conformPasswordController.text) {
                      return "Password not match";
                    } else {
                      return null;
                    }
                  },
                ),
                kHeight20,
                GestureDetector(
                  onTap: () async {
                    final isValidateForm = formkey.currentState!.validate();
                    if (isValidateForm) {
                      signUp();
                    }
                  },
                  child: Center(
                    child: Container(
                      child: Center(
                        child: Text("Sign up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emialController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((value) async {
      final shareprefs = await SharedPreferences.getInstance();
      await shareprefs.setBool(loginKey, true);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => AuthenticationScreen(),
        ),
      );
    });
  }
}
