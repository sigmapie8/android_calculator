import 'package:android_calculator/controller/calculatorController.dart';
import 'package:android_calculator/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class NewButton extends StatelessWidget {
  const NewButton({super.key, required this.number});
  final String number;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40,
      child: TextButton(onPressed: (){},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(fontSize: 20),
          ),
          // padding: MaterialStateProperty.all<EdgeInsets>(
          //   const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          // ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: Text(number,),
        ),),
    );
  }
}

// style: TextStyle(
//           fontSize: 20,
//           color: Colors.white.withOpacity(0.9),
//         )

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 80,
      // height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      decoration:  const ShapeDecoration(
        color: Colors.grey,
        shape: StadiumBorder( side: BorderSide(color: ColorPalette.equalColor, )),
        // border: StadiumBorder(),
        // borderRadius: BorderRadius.all(Radius.circular(34)),
      ),
      child: Text(
        number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white.withOpacity(0.9),
        ),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({super.key, required this.number});

  final String number;

  Color? getBGColor({required String value}) {

    if(value == "AC"){
      return ColorPalette.clearColor;
    } else if(value == "="){
      return ColorPalette.equalColor;
    }
    return ColorPalette.buttonColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      highlightColor: Colors.lightBlueAccent,
      splashColor: Colors.lightBlueAccent,
      onTap: () {
        final CalculatorController calculatorController = Provider.of<CalculatorController>(context, listen: false);
       // final double? data = calculatorController.evaluateExpression("5*5");
       //
       // print("data: $data");

        calculatorController.cal2();
        // if(number == "="){
        //   calculatorController.onButtonClick(ButtonType.equals, number);
        // } else if(number == "+"){
        //   calculatorController.onButtonClick(ButtonType.addition, number);
        // } else if(number == "-"){
        //   calculatorController.onButtonClick(ButtonType.subtraction, number);
        // } else if(number == "*"){
        //   calculatorController.onButtonClick(ButtonType.multiplication, number);
        // } else if(number == "/"){
        //   calculatorController.onButtonClick(ButtonType.division, number);
        // } else {
        //   calculatorController.onButtonClick(ButtonType.number, number);
        // }


        },
      child: ChoiceChip(
        selected: true,
        selectedColor: getBGColor(value: number),
        label: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
