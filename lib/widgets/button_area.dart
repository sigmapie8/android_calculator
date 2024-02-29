import 'package:android_calculator/controller/calculatorController.dart';
import 'package:android_calculator/utility/enums.dart';
import 'package:android_calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonArea extends StatelessWidget {
  const ButtonArea({
    Key? key,
    required this.textEditingController,
    required this.isCompressed,
  }) : super(key: key);

  // final double height;

  final TextEditingController textEditingController;
  final bool isCompressed;

  static const List<List<String>> buttonGrid = [
    ["√", "％", "^", "!"],
    ["AC", "(", ")", "÷"],
    ["7", "8", "9", "x"],
    ["4", "5", "6", "-"],
    ["1", "2", "3", "+"],
    ["0", ".", "back", "="],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: height,
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            6,
            (row) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (column) {
                // backspace button
                if (row == 5 && column == 2) {
                  return CalculatorButton(
                    key: UniqueKey(),
                    text: const Icon(
                      Icons.cancel_presentation_rounded,
                      color: Colors.white,
                    ),
                    radius: MediaQuery.sizeOf(context).width * 0.2,
                    onTap: () {
                      context.read<CalculatorController>().onButtonClick(
                            textEditingController,
                            buttonGrid[row][column].toButtonType(),
                            buttonGrid[row][column],
                          );
                    },
                    isCompressed: isCompressed,
                  );
                } else {
                  return CalculatorButton(
                    key: UniqueKey(),
                    text: Text(
                      buttonGrid[row][column],
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    radius: MediaQuery.sizeOf(context).width * 0.2,
                    backgroundColor: getButtonColor(row: row, column: column),
                    onTap: () {
                      context.read<CalculatorController>().onButtonClick(
                            textEditingController,
                            buttonGrid[row][column].toButtonType(),
                            buttonGrid[row][column],
                          );
                    },
                    isCompressed: isCompressed,
                  );
                }
              }),
            ),
          ),
        ));
  }

  Color getButtonColor({required int row, required int column}) {
    // first row
    if (row == 0) {
      return const Color(0xFF181C1F);
    }
    // equal to button
    else if (row == 5 && column == 3) {
      return const Color(0xFF004D6B);
    }
    // all buttons in 2nd row and last column
    else if (row == 1 || column == 3) {
      return column == 0 ? const Color(0xFF494263) : const Color(0xFF374955);
    }
    // everything else
    else {
      return const Color(0xFF1D2528);
    }
  }
}
