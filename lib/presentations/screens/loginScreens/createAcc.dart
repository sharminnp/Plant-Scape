import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/presentations/screens/loginScreens/LoginScreenMain.dart';
import 'package:plant_app/presentations/screens/loginScreens/authentication_screen.dart';
import 'package:plant_app/presentations/screens/loginScreens/createAcc_profile.dart';
import 'package:plant_app/presentations/screens/widgets/text_field.dart';

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
                padding: const EdgeInsets.only(top: 40),
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
                  "Create Your Account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                child: textFieldWidget(
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: textFieldWidget(
                  controller: emialController,
                  hintText: "E-mail",
                  Icons: Icons.email,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: textFieldWidget(
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
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: textFieldWidget(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: GestureDetector(
                  onTap: () async {
                    final isValidateForm = formkey.currentState!.validate();
                    if (isValidateForm) {
                      signUp();
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 110, top: 13),
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
    );
  }

  Future signUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: emialController.text.trim(),
          password: passwordController.text.trim(),
        )
        .then((value) => {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => AuthenticationScreen()))
            });
  }
}
