import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:norah/api/chatbot_api.dart';
import 'package:norah/api/models/infermedica_models/DiagnosisModel.dart';
import 'package:norah/api/models/infermedica_models/DiagnosisSendingModel.dart';
import 'package:norah/api/models/infermedica_models/ParseModel.dart';

class HomeScreenProvider extends ChangeNotifier{
  bool botIsTexting = false;
  bool showReceived = false;
  ParseModel parseResponse;
  DiagnosisModel diagnosisResponse;
  bool hasParsed = false;
  String idFromApi = "";
  String choiceIdFromApi = "";
  static bool initial = true;
  String chatBotQuestion = "";
  String firstUserQuestionTyped = "";
  ChatBotApi chatBotApi = new ChatBotApi();
  String questionType = '';
  bool shouldStop = false;


  chat(String id, String choiceId) async{
    if(hasParsed == false){
      await performFirstDiagnosis();
    }else{
      await performConcurrentDiagnosis(id, choiceId, initial);
    }


  }

  performFirstDiagnosis() async {
    setBotIsTexting(true);
    await chatBotApi.parseText(ChatBotApi.parseUrl, firstUserQuestionTyped).then((parseResponse) async{
      setBotIsTexting(false);
      hasParsed = true;
      String id = parseResponse.mentions[0].id;
      String choiceId = parseResponse.mentions[0].choiceId;
      idFromApi = id;
      choiceIdFromApi = choiceId;
      await performConcurrentDiagnosis(id, choiceId, initial);
      initial = false;
    });
  }

  performConcurrentDiagnosis(String id, String choiceId, bool initial) async{
    setBotIsTexting(true);

    await chatBotApi.doDiagnosis(ChatBotApi.diagnosisUrl, id, choiceId, initial).then((diagnosisResponse){
      setBotIsTexting(false);
      /*checking if the response from the api has shouldstop key
        this will tell me that i should stop asking questions from the
         api and show the diagnosis
       */
      if(diagnosisResponse.shouldStop == true){
        print("Should stop right now");
        setShouldStop(true);
        setShowReceived(true);
      }else{
        setDiagnosisResponse(diagnosisResponse);
        setChatBotQuestion(diagnosisResponse.question.text);
        questionType = diagnosisResponse.question.type;

        setShowReceived(true);
      }

    });
  }
  void setBotIsTexting(value){
    botIsTexting = value;
    notifyListeners();
  }

  void setParseResponse(value){
    parseResponse = value;
    notifyListeners();
  }

  void setShowReceived(value){
    showReceived = value;
    notifyListeners();
  }

  void setDiagnosisResponse(value){
    diagnosisResponse = value;
    notifyListeners();
  }
  
  void setChatBotQuestion(String value){
    chatBotQuestion = value;
    notifyListeners();
  }

  void setShouldStop(bool value){
    shouldStop = value;
    notifyListeners();
  }

}