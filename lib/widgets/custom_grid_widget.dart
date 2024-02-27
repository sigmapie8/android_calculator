import 'dart:developer';

import 'package:android_calculator/utility/colors.dart';
import 'package:android_calculator/utility/common_functions.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key, required this.numbers, required this.crossAxisCount});

  final List<String> numbers;
  final int crossAxisCount;

  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  late List<List<String>> rowList;

  @override
  void initState() {
    super.initState();
    rowList = CommonFunctions().splitList(widget.numbers, widget.crossAxisCount);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        log("constraints: ${constraints.maxWidth}");
        final double width = (constraints.maxWidth / widget.crossAxisCount) - 10;
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              rowList.length,
              (index) => CustomRowWidget(
                key: Key(index.toString()),
                rowList: rowList[index],
                width: width,
              ),
            ),
          ),
        );
      }
    );
  }
}

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget({super.key, required this.rowList, required this.width});
  final double width;

  final List<String> rowList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        rowList.length,
        (index) => NumberWidget(key: Key(index.toString()), number: rowList[index], width: width),
      ),
    );
  }
}

class NumberWidget extends StatelessWidget {
  const NumberWidget({super.key, required this.number, required this.width});

  final String number;
  final double width;
  final bool minimize = true;
  final double size = 80;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: minimize ? width : size,
      height: minimize ? null : size,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      alignment: Alignment.center,
      decoration:  BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular( minimize ? 34 : 40)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: minimize ? 0 : 0, vertical: minimize ? 14 : 0),
        child: Text(
          number,
          style: const TextStyle(fontSize: 26, color: ColorPalette.buttonColor),
        ),
      ),
    );
  }
}
