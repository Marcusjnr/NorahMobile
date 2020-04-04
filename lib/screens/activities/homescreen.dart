import 'package:flutter/material.dart';
import 'package:norah/custom_widgets/circle_avatar.dart';
import 'package:norah/custom_widgets/receivedmessagewidget.dart';
import 'package:norah/custom_widgets/sentmessagewidget.dart';
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
    chatMessages.message =
        "Hello my name is Norah, what symptoms do you have today?";
    chatMessages.status = MessageType.received;

    messages.add(chatMessages.toJson());

  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    Messages chatMessages = new Messages();

    List<Widget> chats = messages
        .map((message) => message['status'] == MessageType.received
            ? ReceivedMessagesWidget(
                time: message['time'],
                message: message['message'],
              )
            : SentMessageWidget(
                time: message['time'],
                message: message['message'],
              ))
        .toList();

    void _scrollDown() {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 1), curve: Curves.easeOut);
    }

    return Consumer<HomeScreenProvider>(
      builder: (BuildContext context, HomeScreenProvider homeScreenProvider,
          Widget child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              actions: <Widget>[
               PopupMenuButton<int>(
                 itemBuilder: (context) => [
                   PopupMenuItem(
                     value: 1,
                     child: Text(
                       "Profile",
                       style:
                       TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                     ),
                   ),
                   PopupMenuItem(
                     value: 2,
                     child: Text(
                       "Settings",
                       style:
                       TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                     ),
                   ),
                 ],
                 icon: Icon(Icons.more_vert, color: Colors.black,),
                 elevation: 4,
                 padding: EdgeInsets.symmetric(horizontal: 50),
               )

              ],
              leading: IconButton(
                color: Colors.black,
                onPressed: () {},
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
                          children: <Widget>[...chats],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(15.0),
                        height: 61,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            MaterialButton(
                              minWidth: 50,
                              height: 50,
                              color: Theme.of(context).accentColor,
                              onPressed: () {
                                _scrollDown();
                                chatMessages.status = MessageType.sent;
                                chatMessages.message =
                                    homeScreenProvider.buttonOneText;
                                setState(() {
                                  messages.add(chatMessages.toJson());
                                });
                              },
                              child: Text(
                                homeScreenProvider.buttonOneText,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            MaterialButton(
                              minWidth: 50,
                              height: 50,
                              color: Theme.of(context).accentColor,
                              onPressed: () {
                                _scrollDown();
                                chatMessages.status = MessageType.sent;
                                chatMessages.message =
                                    homeScreenProvider.buttonTwoText;
                                setState(() {
                                  messages.add(chatMessages.toJson());
                                });
                              },
                              child: Text(
                                homeScreenProvider.buttonTwoText,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
