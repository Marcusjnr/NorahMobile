import 'package:flutter/material.dart';
import 'package:norah/utils/global.dart';

class SentMessageWidget extends StatelessWidget {
  final String time, message;
  const SentMessageWidget({
    Key key,
    this.time,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          SizedBox(width: 15),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Text(
              "$message",
              style: Theme.of(context).textTheme.body2.apply(
                    color: Colors.white,
                    fontSizeFactor: 1.2
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
