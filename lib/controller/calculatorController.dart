import 'dart:developer';

import 'package:android_calculator/utility/enums.dart';
import 'package:flutter/material.dart';
import 'package:infix_expression_parser/expression_evaluator.dart';
import 'package:infix_expression_parser/infix_expression_converter.dart';

class CalculatorController extends ChangeNotifier {
  double? result;
  String expression = ""; // infix expression

  String convertInfixToPostfix(String infixExpression) {
    final converter = InfixExpressionConverter(expression: infixExpression);
    return converter.toPostfixNotation();
  }

  double calculatePostfixValue(String postfixExpression) {
    final result = ExpressionEvaluator.evaluatePostfix(
        expression: postfixExpression, context: {});
    return result as double;
  }

  double? evaluateExpression(String expression) {
    try {
      final postfixExpression = convertInfixToPostfix(expression);
      return calculatePostfixValue(postfixExpression);
    } catch (error, st) {
      log(error.toString());
      log(st.toString());
      return null;
    }
  }

  void onButtonClick(ButtonType buttonType, String value) {
    if (buttonType == ButtonType.backspace && expression.isNotEmpty) {
      expression = expression.substring(0, expression.length - 1);
    } else if (buttonType == ButtonType.equals) {
    } else {
      expression += value;
    }
    result = evaluateExpression(expression);

    notifyListeners();
  }
}
