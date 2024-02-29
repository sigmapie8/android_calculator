import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [ExpressionArea] contains the expression that the user has typed to be
/// evaluated
class ExpressionArea extends StatefulWidget {
  const ExpressionArea({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  State<ExpressionArea> createState() => _ExpressionAreaState();
}

class _ExpressionAreaState extends State<ExpressionArea> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      enableSuggestions: false,
      autocorrect: false,
      autofillHints: null,
      autofocus: true,
      showCursor: true,
      readOnly: true,
      cursorColor: Colors.blue,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      style: Theme.of(context).textTheme.displayLarge,
      decoration: const InputDecoration(
        counterText: "",
        counter: null,
        border: InputBorder.none,
      ),
      keyboardType: TextInputType.none,
    );
  }
}
