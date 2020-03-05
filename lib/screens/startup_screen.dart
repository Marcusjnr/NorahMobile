
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter/material.dart';
import 'package:norah/custom_widgets/custom_text_field.dart';
import 'package:norah/custom_widgets/gradient_button.dart';
import 'package:norah/providers/startup_screen_provider.dart';
import 'package:provider/provider.dart';

class StartUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color _primaryColor = Theme.of(context).primaryColor;
    return Consumer<StartUpScreenProvider>(
      builder: (BuildContext context, StartUpScreenProvider startUpProvider, Widget child){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400.0,
                child: Center(
                  child: Image.asset("images/logo.png"),
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

                            GradientButton()
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
