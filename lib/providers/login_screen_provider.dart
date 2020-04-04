import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:norah/api/login_api.dart';
import 'package:norah/api/models/LoginModel.dart';
import 'package:norah/screens/activities/homescreen.dart';
import 'package:norah/services/hive_service.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreenProvider extends ChangeNotifier{
  bool hasRegistered = false;
  bool loginPressed = true;
  LoginModel loginResponse = new LoginModel();
  bool loading = false;
  bool responseGotten = false;

  void setHasRegistered(value){
    hasRegistered = value;
    notifyListeners();
  }

  void setLoginPressed(value){
    loginPressed = value;
    notifyListeners();
  }
  
  login(BuildContext context, String email, String password) async{
    setLoading(true);
    LoginApi.login(LoginApi.loginUrl, email, password).then((loginResponse) async {
      setLoginResponse(loginResponse);
      setResponseGotten(true);
      checkSuccess(loginResponse, context);

    }).catchError((e){
      throw e;
    });
  }
  void checkSuccess(LoginModel loginResponse, context){
    bool loginSuccess = loginResponse.success;
    if(loginSuccess == true){
      HiveService.putIsLoggedIn(true);
      HiveService.putUserFirstName(loginResponse.result.firstName);
      print(loginResponse.result.firstName);
      goToHomeScreen(context);
    }else{
      print("Login was not successful");
    }
  }

  void goToHomeScreen(context){
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRightWithFade,
        child: HomeScreen(),
      ),
    );
  }

  void setLoading(value){
    loading = value;
    notifyListeners();
  }
  
  void setLoginResponse(value){
    loginResponse = value;
    notifyListeners();
  }

  void setResponseGotten(value){
    responseGotten = value;
    notifyListeners();
  }


}