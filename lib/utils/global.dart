import 'package:flutter/material.dart';

Color myGreen = Color(0xff4bb17b);
enum MessageType {sent, received}

List<Map<String, dynamic>> allMessages = [
  {
    'status' : MessageType.received,
    'message' : 'Hi my name is Norah, what can i do for you today' ,
  },
//  {
//    'status' : MessageType.sent,
//    'message' : 'Hi, I hope you are doing great!' ,
//  },
//  {
//    'status' : MessageType.sent,
//    'message' : 'Please share with me the details of your project, as well as your time and budgets constraints.' ,
//  },

];

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
