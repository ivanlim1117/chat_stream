import 'dart:convert';
import 'package:chat_stream/model/room_list_model.dart';
import 'package:http/http.dart' as http;

Future<ChatRoomListModal> fetchChatRoomList1() async {
  var token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaWRldi5saXZlY29tLmNvbS5teS9hcGkvdjEvbG9naW4iLCJpYXQiOjE2NTQ4NTcyMTYsImV4cCI6MTY1NzQ4NTIxNiwibmJmIjoxNjU0ODU3MjE2LCJqdGkiOiJxVWlGNGk3Wm1IY3BMZFZXIiwic3ViIjoiMTAwOCIsInBydiI6IjIxYTljMmM1YmQ2NWVjOTIzN2UzYThjNWQwMzg2NGVkM2M3MDI1MjMifQ.Paf65-XROYWsqxhM-irfWrDIynvphw-WPBAgTabHOYM';
  final response = await http.get(
    Uri.parse(
        'https://apidev.livecom.com.my/api/v1/chatroom?unique_id=CS_0010'),
    headers: {'Authorization': 'Bearer$token'},
  );

  if (response.statusCode == 200) {
    return ChatRoomListModal.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Chat Room List 1');
  }
}
