
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:norah/custom_widgets/gradient_button.dart';
import 'package:norah/screens/activities/signup_question.dart';
import 'package:page_transition/page_transition.dart';

class SignUpLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: MediaQuery.of(context).size.width,
        child:  Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context,
                    PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      child: SignUpQuestionScreen()
                    )
                  );
                },
                child: GradientButton(
                  text: "Sign Up With Email",
                ),
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
                      child: Text("Sign Up With Facebook"),
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
                      child: Text("Sign Up With Google"),
                    )
                  ],
                ),
              ],
            )
          ]


    ));
  }
}
