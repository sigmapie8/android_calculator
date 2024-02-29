import 'dart:developer' as dev;

import 'package:android_calculator/utility/enums.dart';
import 'package:android_calculator/utility/infix.dart';
import 'package:android_calculator/widgets/button_area.dart';
import 'package:flutter/material.dart';

class CalculatorController extends ChangeNotifier {
  double? result;
  String expression = ""; // infix expression

  double equationAreaHeight = 200.0;
  TextEditingController textEditingController = TextEditingController();

  void init() {
    textEditingController.addListener(() {});
  }

  bool isButtonCompressed(BuildContext context) {
    return equationAreaHeight > MediaQuery.sizeOf(context).height * 0.3;
  }

  double? evaluateExpression(String expression) {
    try {
      if (expression.isNotEmpty) {
        return double.parse(Infix.toValue(expression));
      }
      return null;
    } catch (error, st) {
      if (error.toString() == "Bad state: No element") {
      } else {
        dev.log(error.toString());
        dev.log(st.toString());
      }

      return null;
    }
  }

  void setEquationAreaHeight(double newHeight) {
    if (newHeight != equationAreaHeight) {
      equationAreaHeight = newHeight;
      notifyListeners();
    }
  }

  void onButtonClick(TextEditingController textEditingController,
      ButtonType buttonType, String value) {
    dev.log("Text Passed: ${textEditingController.text}");

    // locate the current position of counter
    int cursorPosition = textEditingController.selection.baseOffset;

    if (cursorPosition < 0) {
      cursorPosition = 0;
    }
    dev.log("Cursor Position: ${cursorPosition.toString()}");

    final textAfterCursor =
        textEditingController.text.substring(cursorPosition);

    dev.log("textAfterCursor: $textAfterCursor");

    // handle delete
    // we want to remove the charachter right before cursor position
    if (buttonType == ButtonType.backspace &&
        textEditingController.text.isNotEmpty) {
      final textBeforeCursor =
          textEditingController.text.substring(0, cursorPosition - 1);
      expression =
          prepareExpressionFromText(textBeforeCursor + textAfterCursor);
      textEditingController.text = textBeforeCursor + textAfterCursor;
    }
    // handle equal to
    else if (buttonType == ButtonType.equals) {
      if (result != null) {
        expression = result.toString();
        textEditingController.text = result.toString();
        result = null;

        notifyListeners();
        return;
      }
    }
    // handle all clear
    else if (buttonType == ButtonType.allClear) {
      textEditingController.clear();
      expression = "";
      result = null;
    }
    // handle equation
    else {
      String textBeforeCursor = "";
      try {
        textBeforeCursor =
            textEditingController.text.substring(0, cursorPosition + 1);
        dev.log("Correct textBeforeCursor: $textBeforeCursor");
      } catch (e) {
        textBeforeCursor =
            textEditingController.text.substring(0, cursorPosition);
        dev.log("Incorrect textBeforeCursor: $textBeforeCursor");
      }

      expression =
          prepareExpressionFromText(textBeforeCursor + value + textAfterCursor);
      textEditingController.text = textBeforeCursor + value + textAfterCursor;
    }
    dev.log("final Expression: $expression");
    dev.log("final controller text: ${textEditingController.text}");
    result = evaluateExpression(expression);
    dev.log(result.toString());

    notifyListeners();
  }

  String getValueFromButtonValue(String value) {
    if (value == ButtonArea.buttonGrid[0][0]) {
      return "^-2";
    } else if (value == ButtonArea.buttonGrid[1][3]) {
      return "/";
    } else if (value == ButtonArea.buttonGrid[2][3]) {
      return "*";
    }
    return value;
  }

  /// [prepareExpressionFromText] creates [expression] from the text we recieve
  /// from screen
  String prepareExpressionFromText(String text) {
    String result = "";
    for (int i = 0; i < text.length; i++) {
      result += getValueFromButtonValue(text[i]);
    }

    return result;
  }
}
