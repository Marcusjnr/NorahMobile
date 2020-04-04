import 'package:flutter/material.dart';
import 'package:norah/providers/home_screen_provider.dart';
import 'package:norah/providers/login_screen_provider.dart';
import 'package:norah/providers/register_screen_provider.dart';
import 'package:norah/screens/activities/login_screen.dart';
import 'package:norah/services/hive_service.dart';
import 'package:norah/utils/hex_color.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.openHiveBox();
  HiveService.getIsLoggedIn().then((value){
    HiveService.check = value;
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginScreenProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context)=> RegisterProvider(),)

      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: HexColor("AA398E"),
          primaryColorLight: HexColor("D33B93"),
          accentColor: HexColor("DC68AE"),
          fontFamily: "lgc"
        ),
        home: LoginScreen()
      ),
    );
  }
}