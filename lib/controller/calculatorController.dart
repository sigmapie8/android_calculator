import 'dart:developer' as dev;

import 'package:android_calculator/utility/infix.dart';
import 'package:flutter/material.dart';

class CalculatorController extends ChangeNotifier {
  double? result;
  String expression = ""; // infix expression

  double? evaluateExpression(String expression) {
    try {
      return double.parse(Infix.toValue(expression));
    } catch (error, st) {
      dev.log(error.toString());
      dev.log(st.toString());
      return null;
    }
  }

  // void onButtonClick(ButtonType buttonType, String value) {
  //   if (buttonType == ButtonType.backspace && expression.isNotEmpty) {
  //     expression = expression.substring(0, expression.length - 1);
  //   } else if (buttonType == ButtonType.equals) {
  //   } else {
  //     expression += value;
  //   }
  //   result = evaluateExpression(expression);

  //   notifyListeners();
  // }
}
