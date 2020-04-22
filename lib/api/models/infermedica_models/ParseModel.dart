// To parse this JSON data, do
//
//     final parseModel = parseModelFromJson(jsonString);

import 'dart:convert';

ParseModel parseModelFromJson(String str) => ParseModel.fromJson(json.decode(str));

String parseModelToJson(ParseModel data) => json.encode(data.toJson());

class ParseModel {
  List<Mention> mentions;
  bool obvious;

  ParseModel({
    this.mentions,
    this.obvious,
  });

  factory ParseModel.fromJson(Map<String, dynamic> json) => ParseModel(
    mentions: List<Mention>.from(json["mentions"].map((x) => Mention.fromJson(x))),
    obvious: json["obvious"],
  );

  Map<String, dynamic> toJson() => {
    "mentions": List<dynamic>.from(mentions.map((x) => x.toJson())),
    "obvious": obvious,
  };
}

class Mention {
  String id;
  String name;
  String commonName;
  String orth;
  String choiceId;
  String type;

  Mention({
    this.id,
    this.name,
    this.commonName,
    this.orth,
    this.choiceId,
    this.type,
  });

  factory Mention.fromJson(Map<String, dynamic> json) => Mention(
    id: json["id"],
    name: json["name"],
    commonName: json["common_name"],
    orth: json["orth"],
    choiceId: json["choice_id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "common_name": commonName,
    "orth": orth,
    "choice_id": choiceId,
    "type": type,
  };
}
