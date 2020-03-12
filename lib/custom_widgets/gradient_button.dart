
import 'package:flutter/material.dart';
import 'package:norah/utils/hex_color.dart';

class GradientButton extends StatelessWidget {
  final String text;


  GradientButton({this.text});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;
    return Container(
      height: 55.0,
      width: 600.0,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            letterSpacing: 0.2,
            fontFamily: "lgc",
            fontSize: 18.0,
            fontWeight: FontWeight.w800),
      ),
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
              colors:[
                primaryColor,
                accentColor
              ]
          )
      ),
    );
  }
}