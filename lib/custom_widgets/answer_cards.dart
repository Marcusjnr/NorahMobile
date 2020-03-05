

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerCards extends StatelessWidget {
  final String option;
  final String optionAnswer;

  AnswerCards({
    @required this.option,
    @required this.optionAnswer
});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;
    return   Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 80.0,
        child: Card(
          child: ListTile(
            leading: Container(
              margin: EdgeInsets.only(top: 5.0),
              width: 50,
              height: 70,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  gradient: LinearGradient(
                      colors:[
                        primaryColor,
                        accentColor
                      ]
                  )
              ),
              child: Center(
                child: Text(option, style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),),
              ),
            ),
            title: Text(optionAnswer, style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }
}
