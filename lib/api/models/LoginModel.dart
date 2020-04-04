// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  bool success;
  Result result;
  String token;

  LoginModel({
    this.success,
    this.result,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    success: json["success"],
    result: Result.fromJson(json["result"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": result.toJson(),
    "token": token,
  };
}

class Result {
  String id;
  String email;
  String firstName;
  String lastName;
  bool married;
  bool kids;
  int v;

  Result({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.married,
    this.kids,
    this.v,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["_id"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    married: json["married"],
    kids: json["kids"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "married": married,
    "kids": kids,
    "__v": v,
  };
}
