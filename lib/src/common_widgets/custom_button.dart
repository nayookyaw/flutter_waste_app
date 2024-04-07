import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.btnText, this.onPressFunction, Key? key})
      : super(key: key);
  final String btnText;
  final VoidCallback? onPressFunction;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: const Color.fromARGB(255, 245, 247, 248),
        backgroundColor: const Color.fromARGB(255, 55, 124, 118),
      ),
      onPressed: onPressFunction,
      child: Text(btnText),
    );
  }
}
