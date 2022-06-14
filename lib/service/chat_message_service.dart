import 'dart:convert';

import 'package:chat_stream/model/chat_message_model.dart';
import 'package:http/http.dart' as http;

Stream<ChatMessageModel> fetchMessage() async* {
  var token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwaWRldi5saXZlY29tLmNvbS5teS9hcGkvdjEvbG9naW4iLCJpYXQiOjE2NTUwOTA2MzMsImV4cCI6MTY1NzcxODYzMywibmJmIjoxNjU1MDkwNjMzLCJqdGkiOiI2WXR2dTZHVkt2WlNRam9vIiwic3ViIjoiMTAwOCIsInBydiI6IjIxYTljMmM1YmQ2NWVjOTIzN2UzYThjNWQwMzg2NGVkM2M3MDI1MjMifQ.iZQ25h0L2kVxXnWwRANJkA0G1czeH90V8YnYYb2FRZs";
  final response = await http.get(
    Uri.parse('https://apidev.livecom.com.my/api/v1/chat/message/Waheed&&kent'),
    headers: {'Authorization': 'Bearer $token'},
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    await Future<void>.delayed(const Duration(seconds: 1));
    yield ChatMessageModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load chat room');
  }
}
