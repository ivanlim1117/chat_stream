// To parse this JSON data, do
//
//     final chatMessageModel = chatMessageModelFromJson(jsonString);

import 'dart:convert';

ChatMessageModel chatMessageModelFromJson(String str) =>
    ChatMessageModel.fromJson(json.decode(str));

String chatMessageModelToJson(ChatMessageModel data) =>
    json.encode(data.toJson());

class ChatMessageModel {
  ChatMessageModel({
    required this.chatMessage,
    required this.status,
  });

  List<ChatMessage> chatMessage;
  String status;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        chatMessage: List<ChatMessage>.from(
            json["chat_message"].map((x) => ChatMessage.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "chat_message": List<dynamic>.from(chatMessage.map((x) => x.toJson())),
        "status": status,
      };
}

class ChatMessage {
  ChatMessage({
    required this.id,
    required this.chatroomId,
    required this.message,
    required this.type,
    required this.media,
    required this.createdBy,
    required this.sentTo,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  int id;
  String chatroomId;
  String message;
  String type;
  dynamic media;
  String createdBy;
  String sentTo;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        chatroomId: json["chatroom_id"],
        message: json["message"],
        type: json["type"],
        media: json["media"],
        createdBy: json["created_by"],
        sentTo: json["sent_to"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chatroom_id": chatroomId,
        "message": message,
        "type": type,
        "media": media,
        "created_by": createdBy,
        "sent_to": sentTo,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
      };
}
