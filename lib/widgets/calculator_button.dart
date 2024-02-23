import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {Key? key,
      required this.backgroundColor,
      required this.text,
      this.onTap,
      this.isCompressed = false,
      required this.textColor})
      : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback? onTap;
  final bool isCompressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: isCompressed ? const StadiumBorder() : const CircleBorder()),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(text),
          ),
        ));
  }
}
