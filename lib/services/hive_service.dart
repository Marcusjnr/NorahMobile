import 'package:hive/hive.dart';
import 'package:norah/api/models/infermedica_models/DiagnosisSendingModel.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

mixin HiveService{
  static String boxName = "user_db";
  static bool check;
  static Box _hiveBox;
  static String _emailKey = "email";
  static String _firstNameKey = "firstName";
  static String _isLoggedInKey = "isLoggedIn";

  static Future<void> openHiveBox() async{
    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    final Box userBox = await Hive.openBox(boxName);
    _hiveBox = userBox;
  }

  static Future<void> putIsLoggedIn(bool isLoggedIn) async{
    if(_hiveBox == null){
      await openHiveBox();
    }

    await _hiveBox.put(_isLoggedInKey, isLoggedIn);
  }

  static Future<void> putUserFirstName(String userFirstName) async{
    if(_hiveBox == null){
      await openHiveBox();
    }

    await _hiveBox.put(_firstNameKey, userFirstName);
  }

  static Future<void> putUserEmail(String userEmail) async{
    if(_hiveBox == null){
      await openHiveBox();
    }

    await _hiveBox.put(_emailKey, userEmail);
  }

  static Future<String> getEmail() async{
    if(_hiveBox == null){
      await openHiveBox();
    }

    String email = _hiveBox.get(_emailKey);
    return email;
  }

  static Future<String> getFirstName() async{
    if(_hiveBox == null){
      await openHiveBox();
    }

    String firstName = _hiveBox.get(_firstNameKey);
    return firstName;
  }



  static Future<bool> getIsLoggedIn() async{
    if(_hiveBox == null){
      await openHiveBox();
    }

    bool isLoggedIn = _hiveBox.get(_isLoggedInKey);
    bool loggedIn;
    if(isLoggedIn == null){
      loggedIn = false;
    }else{
      loggedIn = true;
    }
    return loggedIn;
  }
}