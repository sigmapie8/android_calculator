import 'package:android_calculator/controller/calculatorController.dart';
import 'package:android_calculator/widgets/button_area.dart';
import 'package:android_calculator/widgets/equation_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Equation Area
          const EquationArea(),
          Consumer<CalculatorController>(builder: (context, controller, child) {
            return Expanded(
              child: ButtonArea(
                textEditingController: controller.textEditingController,
                isCompressed: controller.equationAreaHeight >
                    MediaQuery.sizeOf(context).height * 0.3,
              ),
            );
          }),
        ],
      )),
    );
  }
}
