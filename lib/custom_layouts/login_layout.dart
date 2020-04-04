
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:norah/custom_widgets/custom_text_field.dart';
import 'package:norah/custom_widgets/gradient_button.dart';
import 'package:norah/providers/login_screen_provider.dart';
import 'package:norah/services/hive_service.dart';
import 'package:provider/provider.dart';

class LoginLayout extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = new TextEditingController();
    TextEditingController  _passwordController = new TextEditingController();
    var loginScreenProvider = Provider.of<LoginScreenProvider>(context);
    ScreenUtil.init(context);

        return Container(
            width: MediaQuery.of(context).size.width,
            child:  Column(
              children: <Widget>[
                CustomTextField(
                  icon: Icons.account_circle,
                  label: "Email",
                  password: false,
                  inputType: TextInputType.text,
                  controller: _emailController,
                ),

                Container(
                  height: ScreenUtil().setHeight(20.0),
                ),
                CustomTextField(
                  icon: Icons.vpn_key,
                  label: "Password",
                  password: true,
                  controller: _passwordController,
                  inputType: TextInputType.text,
                ),

                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(30.0)),
                  child: InkWell(
                    onTap: (){
                      String userEmail = _emailController.text;
                      String userPassword = _passwordController.text;
                      if(userEmail.isEmpty || userPassword.isEmpty){
                        print("Please input credentials");
                      }else{

                        loginScreenProvider.login(context, userEmail, userPassword);

                      }

                    },
                    child: loginScreenProvider.loading == false
                        ? GradientButton(text: "Login",)
                        : CircularProgressIndicator(),
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
