import 'package:flutter/material.dart';
import 'package:norah/utils/global.dart';
import 'package:norah/utils/hex_color.dart';

import 'circle_avatar.dart';

class TypingMessagesWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        children: <Widget>[
          MyCircleAvatar(
            imgUrl: "images/logo.png",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: HexColor("f1f2f3"),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child:  Image.asset("images/typing.gif",width: 50, height: 50,),
              ),
            ],
          ),
          SizedBox(width: 15),

        ],
      ),
    );
  }
}
