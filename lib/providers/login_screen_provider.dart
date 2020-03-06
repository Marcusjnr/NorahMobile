import 'package:flutter/foundation.dart';

class LoginScreenProvider extends ChangeNotifier{
  bool hasRegistered = false;
  bool loginPressed = true;


  void setHasRegistered(value){
    hasRegistered = value;
    notifyListeners();
  }

  void setLoginPressed(value){
    loginPressed = value;
    notifyListeners();
  }


}