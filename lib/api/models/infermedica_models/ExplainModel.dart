// To parse this JSON data, do
//
//     final explainModel = explainModelFromJson(jsonString);

import 'dart:convert';

ExplainModel explainModelFromJson(String str) => ExplainModel.fromJson(json.decode(str));

String explainModelToJson(ExplainModel data) => json.encode(data.toJson());

class ExplainModel {
  List<TingEvidence> supportingEvidence;
  List<TingEvidence> conflictingEvidence;
  List<dynamic> unconfirmedEvidence;

  ExplainModel({
    this.supportingEvidence,
    this.conflictingEvidence,
    this.unconfirmedEvidence,
  });

  factory ExplainModel.fromJson(Map<String, dynamic> json) => ExplainModel(
    supportingEvidence: List<TingEvidence>.from(json["supporting_evidence"].map((x) => TingEvidence.fromJson(x))),
    conflictingEvidence: List<TingEvidence>.from(json["conflicting_evidence"].map((x) => TingEvidence.fromJson(x))),
    unconfirmedEvidence: List<dynamic>.from(json["unconfirmed_evidence"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "supporting_evidence": List<dynamic>.from(supportingEvidence.map((x) => x.toJson())),
    "conflicting_evidence": List<dynamic>.from(conflictingEvidence.map((x) => x.toJson())),
    "unconfirmed_evidence": List<dynamic>.from(unconfirmedEvidence.map((x) => x)),
  };
}

class TingEvidence {
  String id;
  String name;
  String commonName;

  TingEvidence({
    this.id,
    this.name,
    this.commonName,
  });

  factory TingEvidence.fromJson(Map<String, dynamic> json) => TingEvidence(
    id: json["id"],
    name: json["name"],
    commonName: json["common_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "common_name": commonName,
  };
}
