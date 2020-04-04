
import 'package:dio/dio.dart';
import 'package:norah/api/models/LoginModel.dart';

class LoginApi{
  static String loginUrl = "https://norah-api.herokuapp.com/api/users/login";

  static Future<LoginModel> login(String url, email, password) async{
    Dio dio = new Dio();
    Response response = await dio.post(
        url,
      data: {
          "email": email,
        "password": password
      }
    );

    LoginModel loginModel;
    if(response.statusCode == 200){
      loginModel = LoginModel.fromJson(response.data);
    }else{
      throw("Error ${response.statusCode}");
    }

    return loginModel;
  }

}