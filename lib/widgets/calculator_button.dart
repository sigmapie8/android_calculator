import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {Key? key,
      this.backgroundColor = const Color(0xFF1D2528),
      required this.text,
      this.onTap,
      this.isCompressed = false,
      this.textColor = Colors.white,
      required this.radius})
      : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final Widget text;
  final VoidCallback? onTap;
  final bool isCompressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: EdgeInsets.zero,
            elevation: 0.0,
            shape: isCompressed ? const StadiumBorder() : const CircleBorder()),
        onPressed: onTap,
        child: SizedBox(
          height: !isCompressed ? radius : radius - 30,
          width: !isCompressed ? radius : radius + 10,
          child: Center(
            child: text,
          ),
        ));
  }
}
