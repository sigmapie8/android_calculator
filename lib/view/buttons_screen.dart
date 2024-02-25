import 'package:android_calculator/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          //  const ButtonWidget(number: "AC"),
            Container(
              //alignment: Alignment.bottomCenter,
             // padding: const EdgeInsets.all(2),
              // margin: const EdgeInsets.only(top: 50),
              color: Colors.green,
              child: const SizedBox(height: 400, child: MyGridView()),
            ),
          ],
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  static const List<String> buttonNames = ["AC", "( )", "%", "/", "7", "8", "9", "*", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "x", "="];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      // Number of columns in the grid
      // crossAxisSpacing: 4.0,
      // Spacing between columns
      // mainAxisSpacing: 4.0,
      // Spacing between rows
      // padding: const EdgeInsets.all(10.0),
      // Padding around the grid
      children: List.generate(
        buttonNames.length,
        (index) {
          return NewButton(number: buttonNames[index]);
        },
      ),
    );
  }
}
