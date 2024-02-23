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
      decoration: const BoxDecoration(color: Color(0xFF181C1F)),
    );
  }
}
