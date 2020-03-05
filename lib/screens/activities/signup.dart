
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:norah/custom_widgets/answer_cards.dart';
import 'package:norah/screens/activities/login_screen.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color accentColor = Theme.of(context).accentColor;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white70,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            height: 30.0,
            width: 30.0,
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

          Container(
            margin: EdgeInsets.only(right: 8.0),
            height: 30.0,
            width: 30.0,
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
        ],
        leading: Center(
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRightWithFade,
                  child: LoginScreen(),
                )
              );
            },
            child: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 30.0, left: 30.0),
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Card(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Text(
                "Are You Above 16",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),

          AnswerCards(
            option: "A",
            optionAnswer: "Yes",
          ),

            AnswerCards(
              option: "B",
              optionAnswer: "No",
            ),

          ],
        ),
      ),
    );
  }
}
