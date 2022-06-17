import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

class ScratchCardPage extends StatefulWidget {
  const ScratchCardPage({Key? key}) : super(key: key);

  @override
  State<ScratchCardPage> createState() => _ScratchCardPageState();
}

class _ScratchCardPageState extends State<ScratchCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scratch Card")),
      body: Center(
        child: Column(
          children: [
            Scratcher(
              brushSize: 30,
              threshold: 50,
              color: Colors.grey,
              onChange: (value) => print("Scratch progress: $value%"),
              onThreshold: () => print("Threshold reached, you won!"),
              child: Container(
                height: 300,
                width: 300,
                child: Image.asset("assets/success.jpeg"),
              ),
            ),
            const SizedBox(
              height: 50,
              child: Text(
                "Scratch Me",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Scratcher(
              brushSize: 50,
              threshold: 50,
              image: Image.asset("assets/trick.jpeg"),
              onChange: (value) => print("Scratch progress: $value%"),
              onThreshold: () => print("Threshold reached, you won!"),
              child: Container(
                height: 300,
                width: 300,
                child: Image.asset("assets/success.jpeg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
