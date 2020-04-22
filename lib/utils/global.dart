import 'package:flutter/material.dart';
import 'package:norah/api/models/infermedica_models/DiagnosisSendingModel.dart';

Color myGreen = Color(0xff4bb17b);
enum MessageType {sent, received}

class Messages{
  var status;
  String message;

  Messages({
    this.status,
    this.message
});

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
    status: json['status'],
    message: json['message']
  );

  Map<String, dynamic> toJson()=>{
    "status": status,
    "message": message
  };
}


List<Map<String, dynamic>> messages = [

];

String email;
String passwordTxt;


