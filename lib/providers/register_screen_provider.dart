import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:norah/api/models/RegisterModel.dart';
import 'package:norah/api/register_api.dart';
import 'package:norah/screens/activities/homescreen.dart';
import 'package:norah/services/hive_service.dart';
import 'package:page_transition/page_transition.dart';

class RegisterProvider extends ChangeNotifier{
  RegisterModel registerResponse = new RegisterModel();
  bool loading = false;
  String dropDownValueMarried = "";
  String dropDownValueGotKids = "";
  String registerUrl = RegisterApi.registerUrl;


  register(BuildContext context, String email, String firstName, String lastName, bool married, bool kids,String password) async{
    setLoading(true);
    RegisterApi.register(registerUrl, email, firstName, lastName, married, kids, password).then((registerResponse){
      setResponseGotten(registerResponse);
      checkSuccess(registerResponse, context);
    });
  }


  void checkSuccess(RegisterModel registerResponse, context){
    bool registerSuccess = registerResponse.success;
    if(registerSuccess == true){
      HiveService.putIsLoggedIn(true);
      HiveService.putUserFirstName(registerResponse.result.firstName);
      //todo replace print with snackbar
      print("regiser succes");
      goToHomeScreen(context);
    }else{
      print("Registration was not successful");
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

  void setResponseGotten(value){
    registerResponse = value;
    notifyListeners();
  }

  void setLoading(value){
    loading = value;
    notifyListeners();
  }

  void setValueMarried(value){
    dropDownValueMarried = value;
    notifyListeners();
  }

  void setValueGotKids(value){
    dropDownValueGotKids = value;
    notifyListeners();
  }
}