import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:norah/api/models/infermedica_models/DiagnosisModel.dart';
import 'package:norah/custom_widgets/circle_avatar.dart';
import 'package:norah/custom_widgets/receivedmessagewidget.dart';
import 'package:norah/custom_widgets/sentmessagewidget.dart';
import 'package:norah/providers/home_screen_provider.dart';
import 'package:norah/services/hive_service.dart';
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
    HiveService.getFirstName().then((firstName) {
      Messages chatMessages = new Messages();
      chatMessages.message =
          "Hello ${firstName[0].toUpperCase()}${firstName.substring(1).toLowerCase()} my name is Norah, what symptoms do you have today?";
      chatMessages.status = MessageType.received;

      setState(() {
        messages.add(chatMessages.toJson());
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    Messages chatMessages = new Messages();
    TextEditingController questionController = new TextEditingController();

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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if(scrollController.hasClients){
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }

      });
    }


    if(Provider.of<HomeScreenProvider>(context).showReceived &&
        Provider.of<HomeScreenProvider>(context).shouldStop == false) {
        chatMessages.status = MessageType.received;
        chatMessages.message = Provider.of<HomeScreenProvider>(context).chatBotQuestion;
        messages.add(chatMessages.toJson());

         chats = messages
            .map((message) => message['status'] == MessageType.received
            ? ReceivedMessagesWidget(
          time: message['time'],
          message: message['message'],
        )
            : SentMessageWidget(
          time: message['time'],
          message: message['message'],
        )).toList();
       _scrollDown();
    }

    if(Provider.of<HomeScreenProvider>(context).shouldStop){
      Messages chatMessages = new Messages();
      chatMessages.message =
      "Your diagnosis is done, please click on view report to view your report";
      chatMessages.status = MessageType.received;

      messages.add(chatMessages.toJson());

      chats = messages
          .map((message) => message['status'] == MessageType.received
          ? ReceivedMessagesWidget(
        time: message['time'],
        message: message['message'],
      )
          : SentMessageWidget(
        time: message['time'],
        message: message['message'],
      )).toList();
      _scrollDown();
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
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(
                        "Settings",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
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
                      homeScreenProvider.botIsTexting
                          ? Text(
                          "Typing....",
                          style: Theme.of(context).textTheme.subtitle.apply(
                              color: myGreen
                          )
                      ):Text(
                        "Online",
                        style: Theme.of(context).textTheme.subtitle.apply(
                          color: myGreen,
                        ),
                      ),
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
                        child: Container(
                          margin:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                          child: ListView(
                            controller: scrollController,
                            shrinkWrap: true,
                            children: <Widget>[...chats],
                          ),
                        ),
                      ),
                      homeScreenProvider.diagnosisResponse == null
                      ? Container(
                        margin: EdgeInsets.all(15.0),
                        height: 61,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(35.0),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 3),
                                        blurRadius: 5,
                                        color: Colors.grey)
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                        icon: Icon(Icons.face), onPressed: () {}),
                                    Expanded(
                                      child: TextField(
                                        controller: questionController,
                                        style: TextStyle(fontSize: 20),
                                        decoration: InputDecoration(
                                            hintText: "Ask Question.....",
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor, shape: BoxShape.circle),
                              child: InkWell(
                                onTap: (){
                                  homeScreenProvider.setShowReceived(false);
                                  homeScreenProvider.firstUserQuestionTyped = questionController.text;
                                  chatMessages.status = MessageType.sent;
                                  chatMessages.message = questionController.text;
                                  if(homeScreenProvider.showReceived == false){
                                    messages.add(chatMessages.toJson());
                                  }
                                  homeScreenProvider.performFirstDiagnosis();
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                      : Container(
                        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        width: MediaQuery.of(context).size.width,
                        height: 35.0,
                        child: homeScreenProvider.questionType == 'single'
                        ? ListView.builder(
                            itemCount: homeScreenProvider.diagnosisResponse.question.items[0].choices.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              Choice choice = homeScreenProvider
                                  .diagnosisResponse
                                  .question
                                  .items[0]
                                  .choices[index];
                              Item item = homeScreenProvider.diagnosisResponse.question.items[0];
                              if (choice.label.isEmpty) {
                                return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 15,
                              );
                              } else if(homeScreenProvider.shouldStop){
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 15,
                                  child: Center(
                                    child: MaterialButton(
                                      minWidth: 50,
                                      height: 50,
                                      color: Theme.of(context).accentColor,
                                      onPressed: (){

                                      },
                                      child: Text(
                                          "View Details",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              }else{
                                return MaterialButton(
                                  minWidth: 50,
                                  height: 50,
                                  color: Theme.of(context).accentColor,
                                  onPressed: () {
                                    String choiceId = 'present';

                                    if(choice.label == 'No'){
                                      choiceId = 'absent';
                                    }else if(choice.label == "Don't know"){
                                      choiceId = 'unknown';
                                    }else{
                                      choiceId = 'present';
                                    }

                                    homeScreenProvider.setShowReceived(false);

                                    homeScreenProvider.chat(item.id, choiceId);

                                    chatMessages.status = MessageType.sent;
                                    chatMessages.message = choice.label;
//
                                    if(homeScreenProvider.showReceived == false){
                                      messages.add(chatMessages.toJson());
                                      scrollController.animateTo(
                                        scrollController.position.maxScrollExtent,
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                    }

                                  },
                                  child: Text(
                                    choice.label,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                );
                              }
                            })
                        :ListView.builder(
                            itemCount: homeScreenProvider.diagnosisResponse.question.items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {

                              Choice choice = homeScreenProvider
                                  .diagnosisResponse
                                  .question
                                  .items[index]
                                  .choices[index];
                              Item item = homeScreenProvider.diagnosisResponse.question.items[index];
                              if (choice.label.isEmpty) {
                                return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 15,
                              );
                              } else if(homeScreenProvider.shouldStop == true){
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 15,
                                  child: Center(
                                    child: MaterialButton(
                                      minWidth: 50,
                                      height: 50,
                                      color: Theme.of(context).accentColor,
                                      onPressed: (){

                                      },
                                      child: Text(
                                        "View Details",
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                );
                              }else{
                                return MaterialButton(
                                  minWidth: 50,
                                  height: 50,
                                  color: Theme.of(context).accentColor,
                                  onPressed: () {
                                    String choiceId = 'present';

                                    if(item.name == 'No'){
                                      choiceId = 'absent';
                                    }else if(item.name == "Don't know"){
                                      choiceId = 'unknown';
                                    }else{
                                      choiceId = 'present';
                                    }

                                    homeScreenProvider.setShowReceived(false);

                                    homeScreenProvider.chat(item.id, choiceId);

                                    chatMessages.status = MessageType.sent;
                                    chatMessages.message = item.name;

                                    if(homeScreenProvider.showReceived == false){
                                      messages.add(chatMessages.toJson());
                                      scrollController.animateTo(
                                        scrollController.position.maxScrollExtent,
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                    }

                                  },
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                );
                              }
                            }),
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
