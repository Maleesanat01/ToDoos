// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
//button file so we can reuse the button elsewhere

class MyButton extends StatelessWidget {
  final String text; //for button name
  VoidCallback onPressed; //for void function

  MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
