// To parse this JSON data, do
//
//     final diagnosisSendingModel = diagnosisSendingModelFromJson(jsonString);

import 'dart:convert';

DiagnosisSendingModel diagnosisSendingModelFromJson(String str) => DiagnosisSendingModel.fromJson(json.decode(str));

String diagnosisSendingModelToJson(DiagnosisSendingModel data) => json.encode(data.toJson());

class DiagnosisSendingModel {
  String sex;
  int age;
  List<Evidence> evidence;

  DiagnosisSendingModel({
    this.sex,
    this.age,
    this.evidence,
  });

  factory DiagnosisSendingModel.fromJson(Map<String, dynamic> json) => DiagnosisSendingModel(
    sex: json["sex"],
    age: json["age"],
    evidence: List<Evidence>.from(json["evidence"].map((x) => Evidence.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "sex": sex,
    "age": age,
    "evidence": List<dynamic>.from(evidence.map((x) => x.toJson())),
  };
}

class Evidence {
  String id;
  ChoiceId choiceId;
  bool initial;

  Evidence({
    this.id,
    this.choiceId,
    this.initial,
  });

  factory Evidence.fromJson(Map<String, dynamic> json) => Evidence(
    id: json["id"],
    choiceId: choiceIdValues.map[json["choice_id"]],
    initial: json["initial"] == null ? null : json["initial"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "choice_id": choiceIdValues.reverse[choiceId],
    "initial": initial == null ? null : initial,
  };
}

enum ChoiceId { PRESENT, ABSENT, UNKNOWN }

final choiceIdValues = EnumValues({
  "absent": ChoiceId.ABSENT,
  "present": ChoiceId.PRESENT,
  "unknown": ChoiceId.UNKNOWN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
