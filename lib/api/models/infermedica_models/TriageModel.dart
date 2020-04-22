// To parse this JSON data, do
//
//     final triageModel = triageModelFromJson(jsonString);

import 'dart:convert';

TriageModel triageModelFromJson(String str) => TriageModel.fromJson(json.decode(str));

String triageModelToJson(TriageModel data) => json.encode(data.toJson());

class TriageModel {
  String triageLevel;
  List<Serious> serious;
  String rootCause;
  bool teleconsultationApplicable;

  TriageModel({
    this.triageLevel,
    this.serious,
    this.rootCause,
    this.teleconsultationApplicable,
  });

  factory TriageModel.fromJson(Map<String, dynamic> json) => TriageModel(
    triageLevel: json["triage_level"],
    serious: List<Serious>.from(json["serious"].map((x) => Serious.fromJson(x))),
    rootCause: json["root_cause"],
    teleconsultationApplicable: json["teleconsultation_applicable"],
  );

  Map<String, dynamic> toJson() => {
    "triage_level": triageLevel,
    "serious": List<dynamic>.from(serious.map((x) => x.toJson())),
    "root_cause": rootCause,
    "teleconsultation_applicable": teleconsultationApplicable,
  };
}

class Serious {
  String id;
  String name;
  String commonName;
  bool isEmergency;

  Serious({
    this.id,
    this.name,
    this.commonName,
    this.isEmergency,
  });

  factory Serious.fromJson(Map<String, dynamic> json) => Serious(
    id: json["id"],
    name: json["name"],
    commonName: json["common_name"],
    isEmergency: json["is_emergency"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "common_name": commonName,
    "is_emergency": isEmergency,
  };
}
