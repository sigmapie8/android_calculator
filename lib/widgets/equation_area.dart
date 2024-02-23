import 'dart:developer';

import 'package:android_calculator/controller/calculatorController.dart';
import 'package:flutter/material.dart';

class EquationArea extends StatefulWidget {
  const EquationArea({Key? key, required this.calculatorController})
      : super(key: key);

  final CalculatorController calculatorController;

  @override
  State<EquationArea> createState() => _EquationAreaState();
}

class _EquationAreaState extends State<EquationArea> {
  double areaHeight = 200.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (areaHeight == 200.0) {
      areaHeight = MediaQuery.sizeOf(context).height * 0.30;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          log(details.globalPosition.direction.toString());
          // if drag up
          if (details.globalPosition.direction < 1.0) {
            if (details.globalPosition.dy >
                MediaQuery.sizeOf(context).height * 0.50) {
              setState(() {
                areaHeight = MediaQuery.sizeOf(context).height * 0.50;
              });
            } else {
              setState(() {
                areaHeight = MediaQuery.sizeOf(context).height * 0.30;
              });
            }
          }
          // if drag down
          else {
            if (details.globalPosition.dy >
                MediaQuery.sizeOf(context).height * 0.30) {
              if (details.globalPosition.dy >
                  MediaQuery.sizeOf(context).height * 0.50) {
                setState(() {
                  areaHeight = MediaQuery.sizeOf(context).height * 0.90;
                });
              } else {
                setState(() {
                  areaHeight = MediaQuery.sizeOf(context).height * 0.50;
                });
              }
            }
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: const BoxDecoration(
            color: Color(0xFF27343C),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
          ),
          width: MediaQuery.sizeOf(context).width,
          height: areaHeight,
          child: ListenableBuilder(
            listenable: widget.calculatorController,
            builder: (context, child) {
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // expression area
                      SizedBox(
                        child: Text(
                          widget.calculatorController.expression,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 56),
                        ),
                      ),
                      //result Area
                      Text(
                        widget.calculatorController.result == null
                            ? ""
                            : widget.calculatorController.result.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  // dragIcon
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.drag_handle,
                      color: Colors.white,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
