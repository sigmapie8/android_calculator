import 'package:android_calculator/controller/calculatorController.dart';
import 'package:android_calculator/widgets/button_area.dart';
import 'package:android_calculator/widgets/equation_area.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xFF27343C),
          textTheme: const TextTheme(
              displaySmall: TextStyle(
            color: Color(0xFFD5E4EC),
          ))),
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  EquationArea(
                    calculatorController: CalculatorController(),
                  ),
                  const ButtonArea(isMinimized: false),
                ],
              ),
            ),
          )),
    );
  }
}
