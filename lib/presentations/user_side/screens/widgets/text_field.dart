import 'package:flutter/material.dart';

class textFieldWidget extends StatelessWidget {
  const textFieldWidget(
      {Key? key,
      required this.hintText,
      this.Icons,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.maxline = 1,
      this.keyboardType})
      : super(key: key);

  final TextInputType? keyboardType;
  final hintText;
  final IconData? Icons;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxline;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      textCapitalization: TextCapitalization.words,
      maxLines: maxline,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(Icons),
        // fillColor: Colors.green,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hintText,
      ),
    );
  }
}
