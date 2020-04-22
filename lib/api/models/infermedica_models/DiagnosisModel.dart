// To parse this JSON data, do
//
//     final diagnosisModel = diagnosisModelFromJson(jsonString);

import 'dart:convert';

DiagnosisModel diagnosisModelFromJson(String str) => DiagnosisModel.fromJson(json.decode(str));

String diagnosisModelToJson(DiagnosisModel data) => json.encode(data.toJson());

class DiagnosisModel {
  Question question;
  List<Condition> conditions;
  Extras extras;
  bool shouldStop;

  DiagnosisModel({
    this.question,
    this.conditions,
    this.extras,
    this.shouldStop,
  });

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) => DiagnosisModel(
    question: Question.fromJson(json["question"]),
    conditions: List<Condition>.from(json["conditions"].map((x) => Condition.fromJson(x))),
    extras: Extras.fromJson(json["extras"]),
    shouldStop: json["should_stop"],
  );

  Map<String, dynamic> toJson() => {
    "question": question.toJson(),
    "conditions": List<dynamic>.from(conditions.map((x) => x.toJson())),
    "extras": extras.toJson(),
    "should_stop": shouldStop,
  };
}

class Condition {
  String id;
  String name;
  String commonName;
  double probability;

  Condition({
    this.id,
    this.name,
    this.commonName,
    this.probability,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    id: json["id"],
    name: json["name"],
    commonName: json["common_name"],
    probability: json["probability"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "common_name": commonName,
    "probability": probability,
  };
}

class Extras {
  Extras();

  factory Extras.fromJson(Map<String, dynamic> json) => Extras(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Question {
  String type;
  String text;
  List<Item> items;
  Extras extras;

  Question({
    this.type,
    this.text,
    this.items,
    this.extras,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    type: json["type"],
    text: json["text"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    extras: Extras.fromJson(json["extras"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "text": text,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "extras": extras.toJson(),
  };
}

class Item {
  String id;
  String name;
  List<Choice> choices;

  Item({
    this.id,
    this.name,
    this.choices,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    choices: List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
  };
}

class Choice {
  String id;
  String label;

  Choice({
    this.id,
    this.label,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
    id: json["id"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
  };
}
