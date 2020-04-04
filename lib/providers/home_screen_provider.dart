
import 'package:flutter/foundation.dart';
import 'package:norah/utils/global.dart';

class HomeScreenProvider extends ChangeNotifier{
  bool botIsTexting = true;
  String buttonOneText = "Yes";
  String  buttonTwoText = "No";
  String  buttonThreeText;
  String  buttonFourText;


  void setBotIsTexting(value){
    botIsTexting = value;
    notifyListeners();
  }

  void setButtonOneText(value){
    buttonOneText = value;
    notifyListeners();
  }

  void setButtonTwoText(value){
    buttonTwoText = value;
    notifyListeners();
  }

  void setButtonThreeText(value){
    buttonThreeText = value;
    notifyListeners();
  }

  void setButtonFourText(value){
    buttonFourText = value;
    notifyListeners();
  }
}