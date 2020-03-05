import 'package:flutter/foundation.dart';

class StartUpScreenProvider extends ChangeNotifier{
  bool hasRegisterd = false;


  void setHasRegistered(value){
    hasRegisterd = value;
    notifyListeners();
  }


}