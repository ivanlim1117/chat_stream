import 'package:chat_stream/model/room_list_model.dart';

import 'package:chat_stream/service/room_list.dart';
import 'package:flutter/material.dart';

class TwoFutures extends StatefulWidget {
  const TwoFutures({Key? key}) : super(key: key);

  @override
  State<TwoFutures> createState() => _TwoFuturesState();
}

class _TwoFuturesState extends State<TwoFutures> {
  late Future<ChatRoomListModal> future1;
  late Future<ChatRoomListModal> future2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future1 = fetchRoomList();
    future2 = fetchRoomList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Two Futures"),
      ),
      body: FutureBuilder<ChatRoomListModal>(
          future: future1,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.chatRoom[1].user.toString());
            } else {
              return Text("nodata");
            }
          }),
    );
  }
}
