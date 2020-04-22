
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:norah/api/models/infermedica_models/DiagnosisModel.dart';
import 'package:norah/api/models/infermedica_models/DiagnosisSendingModel.dart';
import 'package:norah/api/models/infermedica_models/ParseModel.dart';
import 'package:norah/utils/global.dart';

class ChatBotApi{
  static String applicationId = "";
  static String applicationKey = "";
  static String parseUrl = "";
  static String diagnosisUrl = "";
  static String triageUrl = "";
  static String explainUrl = "";
  Evidence evidence = Evidence();
  List<Evidence> evidenceList = [];

 Future<ParseModel> parseText(String url, String text) async{

    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['App-Id'] = ChatBotApi.applicationId;
    dio.options.headers['App-Key'] = ChatBotApi.applicationKey;
    Response response = await dio.post(
        url,
        data: {
         "text": text
        }
    );

    ParseModel parseModel;

    if(response.statusCode == 200){
      parseModel = ParseModel.fromJson(response.data);
    }else{
      throw("Error ${response.statusCode}");
    }

    return parseModel;
  }

  Future<DiagnosisModel> doDiagnosis(String url, String id,String choiceId, bool initial) async{
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['App-Id'] = ChatBotApi.applicationId;
    dio.options.headers['App-Key'] = ChatBotApi.applicationKey;
    Response response;

    //todo catch dio errors
    if(initial){
      if(choiceId == "present"){
        evidence = Evidence(id: id, choiceId: ChoiceId.PRESENT, initial: true);
      }else if(choiceId == "absent"){
        evidence = Evidence(id: id, choiceId: ChoiceId.ABSENT, initial: null);
      }else{
        evidence = Evidence(id: id, choiceId: ChoiceId.UNKNOWN, initial: null);
      }

      evidenceList.add(evidence);

      DiagnosisSendingModel diagnosisSendingModel = new DiagnosisSendingModel(sex: "male", age: 23, evidence: evidenceList);
      var jsonVar = json.encode(diagnosisSendingModel.toJson());
      print(jsonVar);
      response = await dio.post(
          url,
          data: diagnosisSendingModel.toJson()
      );


    }else{
      if(choiceId == "present"){
        evidence = Evidence(id: id, choiceId: ChoiceId.PRESENT, initial: null);
      }else if(choiceId == "absent"){
        evidence = Evidence(id: id, choiceId: ChoiceId.ABSENT, initial: null);
      }else{
        evidence = Evidence(id: id, choiceId: ChoiceId.UNKNOWN, initial: null);
      }

      evidenceList.add(evidence);

      DiagnosisSendingModel diagnosisSendingModel = new DiagnosisSendingModel(sex: "male", age: 23, evidence: evidenceList);
      var jsonVar = json.encode(evidenceList);
      print(jsonVar);
      response = await dio.post(
          url,
          data: diagnosisSendingModel.toJson()
      );
    }


    DiagnosisModel diagnosisModel;
    if(response.statusCode == 200){
      diagnosisModel = DiagnosisModel.fromJson(response.data);
      //print('Entire Response ${json.encode(diagnosisModel)}');
    }else{
      throw("Error ${response.statusCode}");
    }

    return diagnosisModel;
  }
}