import 'package:chat_stream/pages/chat_container.dart';
import 'package:flutter/material.dart';

class ChatMessagePage extends StatelessWidget {
  final String name;

  const ChatMessagePage({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: const Text("Back"),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatContainer(
                        isEntered: true,
                      )),
            );
          },
        ),
        title: Text(name),
      ),
      body: const Center(
        child: Text("Message"),
      ),
    );
  }
}
