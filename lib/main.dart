import 'package:flutter/material.dart';
import 'package:norah/providers/login_screen_provider.dart';
import 'package:norah/screens/activities/login_screen.dart';
import 'package:norah/utils/hex_color.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginScreenProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: HexColor("AA398E"),
          primaryColorLight: HexColor("D33B93"),
          accentColor: HexColor("DC68AE"),
          fontFamily: "lgc"
        ),
        home: LoginScreen(),
      ),
    );
  }
}

