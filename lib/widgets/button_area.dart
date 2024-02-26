import 'package:android_calculator/utility/colors.dart';
import 'package:android_calculator/view/buttons_screen.dart';
import 'package:flutter/material.dart';

class ButtonArea extends StatelessWidget {
  const ButtonArea({Key? key, required this.isMinimized}) : super(key: key);

  final bool isMinimized;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMinimized
          ? MediaQuery.sizeOf(context).height * 0.5
          : MediaQuery.sizeOf(context).height * 0.7,
      decoration:  const BoxDecoration(color: ColorPalette.section3Color),
      child: const SizedBox(height: 400, child: MyGridView()),
    );
  }
}
