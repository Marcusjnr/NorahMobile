import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:norah/custom_widgets/custom_text_field.dart';
import 'package:norah/custom_widgets/gradient_button.dart';
import 'package:norah/custom_widgets/gradient_text.dart';
import 'package:norah/providers/login_screen_provider.dart';
import 'package:norah/screens/activities/signup.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;
    return Consumer<LoginScreenProvider>(
      builder: (BuildContext context, LoginScreenProvider startUpProvider, Widget child){
        return Scaffold(
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
                      child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RotatedBox(
                              quarterTurns: 1,
                                child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),)),
                          ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0)
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                              PageTransition(
                                type: PageTransitionType.leftToRightWithFade,
                                child: SignUpScreen(),
                              )
                          );
                        },
                        child: RotatedBox(
                          quarterTurns: 1,
                            child: Text("Sign Up", style: TextStyle(fontSize: 20.0),)),
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child:  Column(
                          children: <Widget>[
                            CustomTextField(
                              icon: Icons.account_circle,
                              label: "Email",
                              password: false,
                              inputType: TextInputType.text,
                            ),

                            Container(
                              height: 20.0,
                            ),
                            CustomTextField(
                              icon: Icons.vpn_key,
                              label: "Password",
                              password: true,
                            ),

                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: GradientButton(
                                text: "Login",
                              ),
                            ),

                            Text("OR"),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle
                                      ),
                                      child:  Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.facebook,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Login With Facebook"),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.google,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Login With Google"),
                                    )
                                  ],
                                ),
                              ],
                            )

                          ],
                        )
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
}
