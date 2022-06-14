import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String chatMessage;
  const ChatBubble({Key? key, required this.chatMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal,
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      child: Text(chatMessage),
    );
  }
}
