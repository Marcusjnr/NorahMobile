import 'package:flutter/foundation.dart';

class LoginScreenProvider extends ChangeNotifier{
  bool hasRegisterd = false;


  void setHasRegistered(value){
    hasRegisterd = value;
    notifyListeners();
  }


}