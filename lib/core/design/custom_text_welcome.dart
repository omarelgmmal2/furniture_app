import 'package:flutter/material.dart';

class CustomTextWelcome extends StatelessWidget {
  final String text;
  const CustomTextWelcome({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}
