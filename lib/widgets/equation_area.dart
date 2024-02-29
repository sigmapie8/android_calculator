import 'package:android_calculator/controller/calculatorController.dart';
import 'package:android_calculator/widgets/expression_area.dart';
import 'package:android_calculator/widgets/result_area.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [EquationArea] is everything related to equations
/// It consists of 3 areas:
/// 1. Hisory Area - consists of historical calculations
/// 3. Expression Area - consists of current calculation
/// 4. Result Area - consist of the result of the current calculation
class EquationArea extends StatefulWidget {
  const EquationArea({Key? key}) : super(key: key);

  @override
  State<EquationArea> createState() => _EquationAreaState();
}

class _EquationAreaState extends State<EquationArea> {
  double areaHeight = 200.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<CalculatorController>()
          .setEquationAreaHeight(MediaQuery.sizeOf(context).height * 0.30);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Consumer<CalculatorController>(builder: (context, controller, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)),
          ),
          width: MediaQuery.sizeOf(context).width,
          height: controller.equationAreaHeight,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      // color: Colors.amber,
                      )),
              GestureDetector(
                // key: UniqueKey(),
                onVerticalDragUpdate: (details) {
                  // log(details.globalPosition.direction.toString());
                  // if drag up
                  if (details.globalPosition.direction < 1.0) {
                    if (details.globalPosition.dy <
                        MediaQuery.sizeOf(context).height * 0.50) {
                      controller.setEquationAreaHeight(
                          MediaQuery.sizeOf(context).height * 0.30);
                    } else {
                      controller.setEquationAreaHeight(
                          MediaQuery.sizeOf(context).height * 0.50);
                    }
                  }
                  // if drag down
                  else {
                    if (details.globalPosition.dy >
                        MediaQuery.sizeOf(context).height * 0.30) {
                      if (details.globalPosition.dy >
                          MediaQuery.sizeOf(context).height * 0.50) {
                        controller.setEquationAreaHeight(
                            MediaQuery.sizeOf(context).height * 0.95);
                      } else {
                        controller.setEquationAreaHeight(
                            MediaQuery.sizeOf(context).height * 0.50);
                      }
                    }
                  }
                },
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // expression area
                        ExpressionArea(
                          textEditingController:
                              controller.textEditingController,
                        ),
                        // result area
                        ResultArea(
                            result: controller.result == null
                                ? ""
                                : controller.result.toString()),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),

                    // drag icon
                    const Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Icon(
                        Icons.drag_handle,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
