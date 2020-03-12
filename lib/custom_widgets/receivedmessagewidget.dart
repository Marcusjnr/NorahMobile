import 'package:flutter/material.dart';
import 'package:norah/utils/global.dart';
import 'circle_avatar.dart';

class ReceivedMessagesWidget extends StatelessWidget {
  final String message, time;
  const ReceivedMessagesWidget({
    Key key,
    @required this.message,
    @required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .6),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  "$message",
                  style: Theme.of(context).textTheme.body1.apply(
                        color: Colors.black87,
                      fontSizeFactor: 1.2
                      ),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),

        ],
      ),
    );
  }
}
