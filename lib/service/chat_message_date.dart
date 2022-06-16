import 'dart:convert';
import 'package:chat_stream/model/chat_message_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<ChatMessage>> getDateFromChatMessage(String chatRoomId) async {
  var token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaWRldi5saXZlY29tLmNvbS5teS9hcGkvdjEvbG9naW4iLCJpYXQiOjE2NTUxOTQ3NzUsImV4cCI6MTY1NzgyMjc3NSwibmJmIjoxNjU1MTk0Nzc1LCJqdGkiOiJzYWhoNTBXZXl6cmVrNHVpIiwic3ViIjoiMTAxMiIsInBydiI6IjIxYTljMmM1YmQ2NWVjOTIzN2UzYThjNWQwMzg2NGVkM2M3MDI1MjMifQ.LwkdkvvQdd9Te2KERGmBQyQZaMP3R2CrmT1RjWqmqJw';
  final response = await http.get(
    Uri.parse(
        'https://apidev.livecom.com.my/api/v1/chat/message/$chatRoomId'), //Waheed&&kent
    headers: {'Authorization': 'Bearer $token'},
  );
  Future<List<ChatMessage>> data = compute(parseProduct, response.body);
  return data;

  // return ChatMessage.fromJson(jsonDecode(response.body)['chat_message']);
}

List<ChatMessage> parseProduct(String responseBody) {
  try {
    List<dynamic> parse = jsonDecode(responseBody)['chat_message'];

    List<ChatMessage> data =
        parse.map((parse) => ChatMessage.fromJson(parse)).toList();

    return data;
  } catch (ex) {
    throw Exception('Failed to load data');
  }
}
