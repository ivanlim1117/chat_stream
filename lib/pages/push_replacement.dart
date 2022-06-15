import 'package:chat_stream/main.dart';
import 'package:flutter/material.dart';

class PushReplacementPage extends StatelessWidget {
  const PushReplacementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Push Replacement")),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          );
        },
        child: const Text("Push Replacement"),
      )),
    );
  }
}
