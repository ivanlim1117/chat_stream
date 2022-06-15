import 'package:chat_stream/pages/chat_message.dart';
import 'package:flutter/material.dart';

class ChatContainer extends StatefulWidget {
  final bool isEntered;
  final int? indexChanged;
  ChatContainer({Key? key, required this.isEntered, this.indexChanged})
      : super(key: key);

  @override
  State<ChatContainer> createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer> {
  List<Choice> choices = <Choice>[
    Choice(title: 'Adliz', notification: "3", isPressed: false),
    Choice(title: 'Aliya', notification: "4", isPressed: false),
    Choice(title: 'Adam', notification: "9", isPressed: false),
  ];

  List myBool = [false, false, false];
  int myIndex = 0;
  bool isEnterPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Component")),
      body: Center(
          child: ListView.builder(
              itemCount: choices.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      myBool[index] = true;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatMessagePage(
                                name: choices[index].title,
                              )),
                    );
                  },
                  child: ChatComponent(
                    name: choices[index].title,
                    notification: choices[index].notification,
                    isPressed: myBool[index],
                  ),
                );
              })),
    );
  }
}

class ChatComponent extends StatelessWidget {
  final String name, notification;
  final bool isPressed;
  const ChatComponent(
      {Key? key,
      required this.isPressed,
      required this.name,
      required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              width: 200,
              height: 50,
              color: Colors.teal,
              child: Text(name),
            ),
            isPressed == true
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    child: Text(notification),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50)),
                  ),
          ],
        ));
  }
}

class Choice {
  const Choice(
      {this.isPressed, required this.title, required this.notification});
  final String title, notification;
  final bool? isPressed;
}
