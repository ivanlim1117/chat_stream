import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat_stream/model/chat_message_model.dart';
import 'package:chat_stream/pages/component/chat_bubble.dart';
import 'package:chat_stream/service/chat_message_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textController = TextEditingController();
  late Stream<ChatMessageModel> streamChat;
  late Timer timer;
  final StreamController<List<dynamic>> _streamController = StreamController();
  String text1 = "";

  getMsg() async {
    try {
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaWRldi5saXZlY29tLmNvbS5teS9hcGkvdjEvbG9naW4iLCJpYXQiOjE2NTUwOTA2MzMsImV4cCI6MTY1NzcxODYzMywibmJmIjoxNjU1MDkwNjMzLCJqdGkiOiI2WXR2dTZHVkt2WlNRam9vIiwic3ViIjoiMTAwOCIsInBydiI6IjIxYTljMmM1YmQ2NWVjOTIzN2UzYThjNWQwMzg2NGVkM2M3MDI1MjMifQ.iZQ25h0L2kVxXnWwRANJkA0G1czeH90V8YnYYb2FRZs";
      final response = await http.get(
        Uri.parse(
            'https://apidev.livecom.com.my/api/v1/chat/message/Waheed&&kent'),
        headers: {'Authorization': 'Bearer $token'},
      );

      final databody = json.decode(response.body);
      print(databody['chat_message']);
      _streamController.sink.add(databody['chat_message']);
    } catch (ex) {
      print(ex);
      _streamController.close();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      try {
        getMsg();
      } catch (ex) {
        if (ex != null) {
          timer.cancel();
        }
      }
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Page")),
      body: StreamBuilder<List<dynamic>>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ChatBubble(
                          chatMessage:
                              snapshot.data![index]['message'].toString(),
                        );
                        // return Text(
                        //     snapshot.data![index]['message'].toString());
                      });
                } else {
                  print('no data');
                  return Container();
                }
            }
          }),
    );
  }
}
