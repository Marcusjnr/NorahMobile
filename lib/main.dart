import 'package:flutter/material.dart';
import 'package:norah/providers/startup_screen_provider.dart';
import 'package:norah/screens/startup_screen.dart';
import 'package:norah/utils/hex_color.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StartUpScreenProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: HexColor("AA3983"),
          primaryColorLight: HexColor("D33B93"),
          accentColor: HexColor("DC68A3"),
          fontFamily: "lgc"
        ),
        home: StartUpScreen(),
      ),
    );
  }
}

