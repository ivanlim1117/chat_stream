import 'dart:convert';
import 'package:chat_stream/model/room_list_model.dart';
import 'package:http/http.dart' as http;

Future<ChatRoomListModal> fetchRoomList() async {
  var token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaWRldi5saXZlY29tLmNvbS5teS9hcGkvdjEvbG9naW4iLCJpYXQiOjE2NTUxOTQ3NzUsImV4cCI6MTY1NzgyMjc3NSwibmJmIjoxNjU1MTk0Nzc1LCJqdGkiOiJzYWhoNTBXZXl6cmVrNHVpIiwic3ViIjoiMTAxMiIsInBydiI6IjIxYTljMmM1YmQ2NWVjOTIzN2UzYThjNWQwMzg2NGVkM2M3MDI1MjMifQ.LwkdkvvQdd9Te2KERGmBQyQZaMP3R2CrmT1RjWqmqJw";
  final response = await http.get(
    Uri.parse('https://apidev.livecom.com.my/api/v1/chatroom?unique_id=CS0014'),
    headers: {'Authorization': 'Bearer $token'},
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return ChatRoomListModal.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load chat room');
  }
}
