
import 'package:flutter/material.dart';
import 'package:norah/custom_widgets/circle_avatar.dart';
import 'package:norah/custom_widgets/receivedmessagewidget.dart';
import 'package:norah/custom_widgets/sentmessagewidget.dart';
import 'package:norah/custom_widgets/typingmessagewidget.dart';
import 'package:norah/providers/home_screen_provider.dart';
import 'package:norah/utils/global.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Messages chatMessages = new Messages();
    chatMessages.message = "hel";
    chatMessages.status = MessageType.received;

    messages.add(chatMessages.toJson());
  }
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    List<Widget> chats = messages
        .map((message) => message['status'] == MessageType.received
        ? ReceivedMessagesWidget(
      time: message['time'],
      message: message['message'],
    )
        : SentMessageWidget(
      time: message['time'],
      message: message['message'],
    )).toList();


    return Consumer<HomeScreenProvider>(
      builder: (BuildContext context, HomeScreenProvider homeScreenProvider, Widget child){
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.black,),
                  onPressed: () {},
                ),
              ],
              leading: IconButton(
                color: Colors.black,
                onPressed: (){

                },
                icon: Icon(Icons.arrow_back),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyCircleAvatar(
                    imgUrl: "images/logo.png",
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Norah",
                        style: Theme.of(context).textTheme.subhead,
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        "Online",
                        style: Theme.of(context).textTheme.subtitle.apply(
                          color: myGreen,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            body: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          children: <Widget>[
                            ...chats
                          ],

                        ),
                      ),

                      Container(
                        margin: EdgeInsets.all(15.0),
                        height: 61,
                        child: Row(
                          children: <Widget>[
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              color: Colors.grey,
                              height: 12,
                              width: 12,
                            ),
                            Expanded(
                              child: MaterialButton(
                                onPressed: (){
                                  scrollController.animateTo(
                                    scrollController.position.maxScrollExtent,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 300),
                                  );
                                },
                                color: Colors.blue,

                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}





