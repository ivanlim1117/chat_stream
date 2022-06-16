// To parse this JSON data, do
//
//     final chatMessage = chatMessageFromJson(jsonString);

import 'dart:convert';

ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(ChatMessage data) => json.encode(data.toJson());

class ChatMessage {
  ChatMessage({
    required this.chatMessage,
    required this.status,
  });

  List<ChatMessageElement> chatMessage;
  String status;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        chatMessage: List<ChatMessageElement>.from(
            json["chat_message"].map((x) => ChatMessageElement.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "chat_message": List<dynamic>.from(chatMessage.map((x) => x.toJson())),
        "status": status,
      };
}

class ChatMessageElement {
  ChatMessageElement({
    required this.id,
    required this.chatroomId,
    required this.message,
    required this.type,
    required this.media,
    required this.createdBy,
    required this.sentTo,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  int id;
  String chatroomId;
  String message;
  Type type;
  String media;
  String createdBy;
  String sentTo;
  int isRead;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  factory ChatMessageElement.fromJson(Map<String, dynamic> json) =>
      ChatMessageElement(
        id: json["id"],
        chatroomId: json["chatroom_id"],
        message: json["message"],
        type: json["type"],
        media: json["media"],
        createdBy: json["created_by"],
        sentTo: json["sent_to"],
        isRead: json["is_read"],
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
        "is_read": isRead,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
      };
}
