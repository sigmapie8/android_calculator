import 'package:android_calculator/calculator.dart';
import 'package:android_calculator/controller/calculatorController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            primaryColor: const Color(0xFF27343C),
            scaffoldBackgroundColor: const Color(0xFF181C1F),
            textTheme: const TextTheme(
              displaySmall: TextStyle(
                color: Color(0xFFD5E4EC),
                fontSize: 35,
              ),
              displayMedium: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
              displayLarge: TextStyle(
                color: Colors.white,
                fontSize: 60,
              ),
            )),
        home: const Calculator(),
      ),
    );
  }
}
