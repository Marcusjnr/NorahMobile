

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:norah/custom_widgets/custom_text_field.dart';
import 'package:norah/custom_widgets/gradient_button.dart';

class LoginLayout extends StatelessWidget {
  final emailController, passwordController;

  LoginLayout({
   @required this.emailController,
    @required this.passwordController
});
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return  Container(
        width: MediaQuery.of(context).size.width,
        child:  Column(
          children: <Widget>[
            CustomTextField(
              icon: Icons.account_circle,
              label: "Email",
              password: false,
              inputType: TextInputType.text,
              controller: emailController,
            ),

            Container(
              height: ScreenUtil().setHeight(20.0),
            ),
            CustomTextField(
              icon: Icons.vpn_key,
              label: "Password",
              password: true,
              controller: passwordController,
              inputType: TextInputType.text,
            ),

            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(30.0)),
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
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(8.0)),
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
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(8.0)),
                      child: Text("Login With Google"),
                    )
                  ],
                ),
              ],
            )

          ],
        )
    );
  }
}
