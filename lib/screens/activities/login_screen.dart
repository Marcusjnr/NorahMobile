import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:norah/custom_layouts/login_layout.dart';
import 'package:norah/custom_layouts/signup_layout.dart';
import 'package:norah/custom_widgets/gradient_text.dart';
import 'package:norah/providers/login_screen_provider.dart';
import 'package:norah/screens/activities/homescreen.dart';
import 'package:norah/services/hive_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    // TODO: implement initState
    print(HiveService.check);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;

    return Consumer<LoginScreenProvider>(
      builder: (BuildContext context, LoginScreenProvider loginProvider, Widget child){
        return HiveService.check
            ? HomeScreen()
            : Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400.0,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image.asset("images/logo.png"),
                    ),
                    GradientText("Norah",
                      fontSize: 50.0,
                      gradient: LinearGradient(colors: [
                        primaryColor,
                        accentColor,
                      ]),)

                  ],
                ),
              ),

              Positioned(
                top: 400 / 2 - 100,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: loginProvider.loginPressed
                          ? Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              loginProvider.setLoginPressed(true);
                            },
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),)),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)
                            )
                        ),
                      ) :
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              loginProvider.setLoginPressed(true);
                            },
                            child: RotatedBox(
                                quarterTurns: 1,
                                child: Text("Login", style: TextStyle(color: Colors.black, fontSize: 20),)),
                          ),
                        ),

                      ),
                    ),

                    loginProvider.loginPressed
                        ?  Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: (){
                          loginProvider.setLoginPressed(false);
                        },
                        child: RotatedBox(
                            quarterTurns: 1,
                            child: Text("Sign Up", style: TextStyle(fontSize: 20.0),)),
                      ),
                    ) :
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            loginProvider.setLoginPressed(true);
                          },
                          child: RotatedBox(
                              quarterTurns: 1,
                              child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)
                          )
                      ),
                    )
                  ],
                ),
              ),

              Container(
                  padding:
                  EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 30),
                  margin: EdgeInsets.only(top: 320),
                  constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height - 320),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),

                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        AnimatedSwitcher(
                          child: loginProvider.loginPressed
                              ? LoginLayout()
                              : SignUpLayout(),
                          duration: Duration(seconds: 1),
                        )

                      ],
                    ),
                  )
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Hive.box('user_db').close();
  }
}
