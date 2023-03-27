import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/presentations/user_side/screens/loginScreens/sign_in_with_Password.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/snackbar.dart';
import 'package:plant_app/presentations/user_side/screens/widgets/text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emialController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    emialController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  IconButton(
                      iconSize: 30,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInWithPassword()));
                      },
                      icon: Icon(Icons.arrow_back)),
                  Text(
                    "Forget Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: textFieldWidget(
                controller: emialController,
                hintText: "E-mail",
                Icons: Icons.mail,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email'
                        : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: GestureDetector(
                onTap: () async {
                  log("button pressed");
                  final isValidateForm = formkey.currentState!.validate();
                  if (isValidateForm) {
                    resetPassword();
                  }
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 75, top: 10),
                    child: Text("Send Mail",
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
    );
  }

  Future resetPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emialController.text.trim())
        .onError((error, stackTrace) => Utils.customSnackbar(
            context: context,
            text: error.toString(),
            type: AnimatedSnackBarType.success))
        .then((value) => Utils.customSnackbar(
            context: context,
            text: "mail sended succesfully",
            type: AnimatedSnackBarType.success));
  }
}
