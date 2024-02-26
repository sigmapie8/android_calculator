import 'dart:convert';

import 'package:android_calculator/model/history_model.dart';
import 'package:android_calculator/utility/colors.dart';
import 'package:android_calculator/utility/common_functions.dart';
import 'package:android_calculator/utility/dummy_data.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late HistoryModel historyModel;

  @override
  void initState() {
    super.initState();
    historyModel = historyModelFromJson(json.encode(DummyData().historyMap));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 500,//  constraints.maxHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListView.separated(
                    itemCount: historyModel.content?.length ?? 0,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    reverse: true,
                    itemBuilder: (context, index) {
                      final String dd = CommonFunctions().getRelativeTime(dateTime: historyModel.content?[index].date ?? DateTime.now());
                      print("Date 44 33: $dd");
                      return Container(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              //historyModel.content?[index].date?.toIso8601String() ?? "",
                              dd,
                              style: const TextStyle(fontSize: 18, color: ColorPalette.numberColor),
                            ),
                            const SizedBox(height: 10),
                            HistoryListWidget(history: historyModel.content?[index].history ?? []),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 6),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

class HistoryListWidget extends StatelessWidget {
  const HistoryListWidget({super.key, required this.history});

  final List<History> history;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        history.length,
        (index) => HistoryDataWidget(
          key: Key(index.toString()),
          expression: history[index].expression ?? "",
          result: history[index].result ?? "",
        ),
      ),
    );
  }
}

class HistoryDataWidget extends StatelessWidget {
  const HistoryDataWidget({super.key, required this.expression, required this.result});

  final String expression;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.bottomRight,
          child: Text(
            expression,
            style: const TextStyle(
              fontSize: 22,
              color: ColorPalette.numberColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.bottomRight,
          child: Text(
            result,
            style: const TextStyle(
              fontSize: 22,
              color: ColorPalette.numberColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
