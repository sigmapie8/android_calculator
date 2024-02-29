import 'package:android_calculator/widgets/button_area.dart';

enum ButtonType {
  number,
  multiplication,
  division,
  subtraction,
  addition,
  modulus,
  squareRoort,
  bracketOpen,
  bracketClose,
  backspace,
  decimal,
  factorial,
  power,
  equals,
  allClear,
}

/// [ButtonTypeX] converts button text to [ButtonType]
/// Default [ButtonType] is [ButtonType.number]
extension ButtonTypeX on String {
  ButtonType toButtonType() {
    if (List.generate(10, (index) => index.toString()).contains(this)) {
      return ButtonType.number;
    } else if (this == ButtonArea.buttonGrid[0][0]) {
      return ButtonType.squareRoort;
    } else if (this == ButtonArea.buttonGrid[0][1]) {
      return ButtonType.modulus;
    } else if (this == ButtonArea.buttonGrid[0][2]) {
      return ButtonType.power;
    } else if (this == ButtonArea.buttonGrid[0][3]) {
      return ButtonType.factorial;
    } else if (this == ButtonArea.buttonGrid[1][0]) {
      return ButtonType.allClear;
    } else if (this == ButtonArea.buttonGrid[1][1]) {
      return ButtonType.bracketOpen;
    } else if (this == ButtonArea.buttonGrid[1][2]) {
      return ButtonType.bracketClose;
    } else if (this == ButtonArea.buttonGrid[1][3]) {
      return ButtonType.division;
    } else if (this == ButtonArea.buttonGrid[2][3]) {
      return ButtonType.multiplication;
    } else if (this == ButtonArea.buttonGrid[3][3]) {
      return ButtonType.subtraction;
    } else if (this == ButtonArea.buttonGrid[4][3]) {
      return ButtonType.addition;
    } else if (this == ButtonArea.buttonGrid[5][1]) {
      return ButtonType.decimal;
    } else if (this == ButtonArea.buttonGrid[5][2]) {
      return ButtonType.backspace;
    } else if (this == ButtonArea.buttonGrid[5][3]) {
      return ButtonType.equals;
    } else {
      return ButtonType.number;
    }
  }
}
