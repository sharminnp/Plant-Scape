import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/presentations/screens/loginScreens/LoginScreenMain.dart';
import 'package:plant_app/presentations/screens/loginScreens/authentication_screen.dart';
import 'package:plant_app/presentations/screens/loginScreens/forgot_password.dart';
import 'package:plant_app/presentations/screens/widgets/snackbar.dart';
import 'package:plant_app/presentations/screens/widgets/text_field.dart';

class SignInWithPassword extends StatefulWidget {
  const SignInWithPassword({super.key});

  @override
  State<SignInWithPassword> createState() => _SignInWithPasswordState();
}

class _SignInWithPasswordState extends State<SignInWithPassword> {
  final emialController = TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 350, top: 15),
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  "Plantscape",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Sign in With Password",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: textFieldWidget(
                  hintText: "E-mail",
                  controller: emialController,
                  Icons: Icons.mail,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: textFieldWidget(
                  hintText: "Password",
                  controller: passwordController,
                  Icons: Icons.password,
                  validator: (value) {
                    if (value != null && value.length < 7) {
                      return 'Enter min.7 characters';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPassword()));
                  },
                  child: Container(
                      height: 50,
                      width: 130,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: GestureDetector(
                  onTap: () async {
                    final isValidateForm = formkey.currentState!.validate();
                    if (isValidateForm) {
                      signIn();
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 85, top: 10),
                      child: Text("Sign in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.green[800],
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: emialController.text.trim(),
          password: passwordController.text.trim(),
        )
        .onError((error, stackTrace) => Utils.customSnackbar(
            context: context,
            text: error.toString(),
            type: AnimatedSnackBarType.warning))
        .then((value) => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => AuthenticationScreen()))
            });
  }
}
