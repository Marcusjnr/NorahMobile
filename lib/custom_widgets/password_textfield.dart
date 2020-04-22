
import 'package:flutter/material.dart';
import 'package:norah/providers/login_screen_provider.dart';
import 'package:norah/utils/global.dart';
import 'package:provider/provider.dart';

class PasswordTextField extends StatelessWidget {
  final bool password;
  final String label;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController controller;

  PasswordTextField({
    @required this.label,
    @required this.icon,
    @required this.inputType,
    @required this.password,
    @required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
        EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextField(
            controller: controller,
            obscureText: password,
            onChanged: (String value){
              passwordTxt = value;
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: label,
                icon: Icon(
                  icon,
                  color: Colors.black38,
                ),
                labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'lgc',
                    letterSpacing: 0.3,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600)),
            keyboardType: inputType,
          ),
        ),
      ),
    );
  }
}