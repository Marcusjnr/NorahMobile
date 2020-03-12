
import 'package:flutter/foundation.dart';

class HomeScreenProvider extends ChangeNotifier{
  bool botIsTexting = true;


  void setBotIsTexting(value){
    botIsTexting = value;
    notifyListeners();
  }
}