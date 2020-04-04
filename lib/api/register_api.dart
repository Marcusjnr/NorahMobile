
import 'package:dio/dio.dart';
import 'package:norah/api/models/LoginModel.dart';
import 'package:norah/api/models/RegisterModel.dart';

class RegisterApi{
  static String registerUrl = "https://norah-api.herokuapp.com/api/users/register";

  static Future<RegisterModel> register(String url, String email, String firstName, String lastName, bool married, bool kids,String password) async{
    Dio dio = new Dio();
    Response response = await dio.post(
        url,
        data: {
          "email": email,
          "first_name": firstName,
          "last_name": lastName,
          "married": married,
          "kids": kids,
          "password": password,
        }
    );

    RegisterModel registerModel;
    if(response.statusCode == 200){
      registerModel = RegisterModel.fromJson(response.data);

    }else{
      throw("Error ${response.statusCode}");
    }

    return registerModel;
  }

}