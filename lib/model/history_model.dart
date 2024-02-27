import 'dart:convert';

HistoryModel historyModelFromJson(String str) => HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  List<Content>? content;

  HistoryModel({
    this.content,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
    content: json["content"] == null ? [] : List<Content>.from(json["content"]!.map((x) => Content.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x.toJson())),
  };
}

class Content {
  DateTime? date;
  List<History>? history;

  Content({
    this.date,
    this.history,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    history: json["history"] == null ? [] : List<History>.from(json["history"]!.map((x) => History.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date?.toIso8601String(),
    "history": history == null ? [] : List<dynamic>.from(history!.map((x) => x.toJson())),
  };
}

class History {
  String? expression;
  String? result;

  History({
    this.expression,
    this.result,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
    expression: json["expression"],
    result: json["result"],
  );

  Map<String, dynamic> toJson() => {
    "expression": expression,
    "result": result,
  };
}
