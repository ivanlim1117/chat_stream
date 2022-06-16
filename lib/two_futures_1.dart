import 'package:chat_stream/model/chat_message_model.dart';
import 'package:chat_stream/model/room_list_model.dart';
import 'package:chat_stream/service/room_list.dart';
import 'package:flutter/material.dart';

import 'pages/chat_page.dart';
import 'service/chat_message_date.dart';
import 'service/chat_room_list1_service.dart';

class SecondTwoFutures extends StatefulWidget {
  SecondTwoFutures({Key? key}) : super(key: key);

  @override
  State<SecondTwoFutures> createState() => _SecondTwoFuturesState();
}

class _SecondTwoFuturesState extends State<SecondTwoFutures> {
  late Future<ChatRoomListModal> futureChatRoomList1;
  late Future<ChatRoomListModal> futureChatRoomList2;
  late Future<ChatMessageModel> futureChatMessage;
  List list1 = [];
  List list2 = [];
  List chatMessageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureChatRoomList1 = fetchChatRoomList1();
    futureChatRoomList2 = fetchChatRoomList1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("2 Futures xxx")),
      body: Row(
        children: [
          Expanded(
            child: FutureBuilder<List>(
              future: Future.wait([futureChatRoomList1, futureChatRoomList2]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  for (int i = 0; i < snapshot.data![0].chatRoom.length; i++) {
                    String id = snapshot.data![0].chatRoom[i].id.toString();

                    list1.add(id);
                  }
                  for (int i = 0; i < snapshot.data![1].chatRoom.length; i++) {
                    String uid =
                        snapshot.data![1].chatRoom[i].chatroomId.toString();

                    list2.add(uid);
                  }
                  // print(list1);
                  // print(list2);
                  return ListView.builder(
                      itemCount: list2.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  chatRoomId: list2[index],
                                ),
                              ),
                            );
                          },
                          child: ContainerToStoreData(
                            name1: list1[index],
                            name2: list2[index],
                            date: "Date",
                            widget: FutureBuilder<List<ChatMessage>>(
                              future: getDateFromChatMessage(
                                  list2[index].toString()),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    width: 100,
                                    color: Colors.amberAccent,
                                    child: Text(snapshot.data!.last.createdAt
                                        .toString()),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerToStoreData extends StatelessWidget {
  final String name1, name2, date;
  final Widget? widget;
  const ContainerToStoreData(
      {Key? key,
      required this.name1,
      required this.name2,
      required this.date,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(children: [
          Container(
              width: 100, height: 20, color: Colors.amber, child: Text(name1)),
          Container(
              width: 100, height: 20, color: Colors.blue, child: Text(name2)),
          Container(
              width: 100, height: 20, color: Colors.red, child: Text(date)),
          widget ?? Container(),
        ]),
      ),
    );
  }
}
