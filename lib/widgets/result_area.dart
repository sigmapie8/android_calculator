import 'package:flutter/material.dart';

/// [ResultArea] shows the result of any calculation
class ResultArea extends StatelessWidget {
  const ResultArea({Key? key, required this.result}) : super(key: key);

  final String result;

  @override
  Widget build(BuildContext context) {
    return Text(
      result,
      style: Theme.of(context).textTheme.displayMedium,
      textAlign: TextAlign.right,
    );
  }
}
