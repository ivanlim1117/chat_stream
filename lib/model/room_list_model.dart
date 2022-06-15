// To parse this JSON data, do
//
//     final chatRoomListModel = chatRoomListModelFromJson(jsonString);

import 'dart:convert';

ChatRoomListModal chatRoomListModelFromJson(String str) =>
    ChatRoomListModal.fromJson(json.decode(str));

String chatRoomListModelToJson(ChatRoomListModal data) =>
    json.encode(data.toJson());

class ChatRoomListModal {
  ChatRoomListModal({
    required this.chatRoom,
    required this.status,
    required this.success,
  });

  List<ChatRoom> chatRoom;
  String status;
  bool success;

  factory ChatRoomListModal.fromJson(Map<String, dynamic> json) =>
      ChatRoomListModal(
        chatRoom: List<ChatRoom>.from(
            json["chat_room"].map((x) => ChatRoom.fromJson(x))),
        status: json["status"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "chat_room": List<dynamic>.from(chatRoom.map((x) => x.toJson())),
        "status": status,
        "success": success,
      };
}

class ChatRoom {
  ChatRoom({
    required this.id,
    required this.chatroomId,
    required this.userUniqueId,
    required this.chat,
    required this.user,
    required this.seller,
  });

  int id;
  String chatroomId;
  String userUniqueId;
  dynamic chat;
  User user;
  dynamic seller;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        id: json["id"],
        chatroomId: json["chatroom_id"],
        userUniqueId: json["user_unique_id"],
        chat: json["chat"],
        user: User.fromJson(json["user"]),
        seller: json["seller"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chatroom_id": chatroomId,
        "user_unique_id": userUniqueId,
        "chat": chat,
        "user": user.toJson(),
        "seller": seller,
      };
}

class User {
  User({
    required this.customerId,
    required this.customerGroupId,
    required this.storeId,
    required this.languageId,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.nickname,
    required this.email,
    required this.telephoneCountrycode,
    required this.telephone,
    required this.fax,
    required this.password,
    required this.profileUrl,
    required this.salt,
    required this.cart,
    required this.wishlist,
    required this.newsletter,
    required this.addressId,
    required this.customField,
    required this.ip,
    required this.status,
    required this.emailVerified,
    required this.safe,
    required this.token,
    required this.referralToken,
    required this.pin,
    required this.code,
    required this.isBlocked,
    required this.warningLevel,
    required this.blockLiveStream,
    required this.facebookId,
    required this.uniqueId,
    required this.dateAdded,
    required this.isDelete,
    required this.gender,
    required this.praisePopup,
    required this.language,
    required this.selectLanguageId,
    required this.googleId,
    required this.appleId,
    required this.referredBy,
    required this.lastloginDatetime,
    required this.userId,
    required this.refLink,
    required this.referId,
  });

  int customerId;
  int customerGroupId;
  int storeId;
  int languageId;
  String firstname;
  String lastname;
  String username;
  String nickname;
  String email;
  String telephoneCountrycode;
  String telephone;
  String fax;
  String password;
  dynamic profileUrl;
  String salt;
  dynamic cart;
  dynamic wishlist;
  int newsletter;
  int addressId;
  String customField;
  String ip;
  int status;
  int emailVerified;
  int safe;
  String token;
  dynamic referralToken;
  dynamic pin;
  String code;
  int isBlocked;
  dynamic warningLevel;
  int blockLiveStream;
  dynamic facebookId;
  dynamic uniqueId;
  DateTime dateAdded;
  int isDelete;
  dynamic gender;
  int praisePopup;
  String language;
  int selectLanguageId;
  dynamic googleId;
  dynamic appleId;
  String referredBy;
  dynamic lastloginDatetime;
  String userId;
  String refLink;
  String referId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        customerId: json["customer_id"],
        customerGroupId: json["customer_group_id"],
        storeId: json["store_id"],
        languageId: json["language_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        nickname: json["nickname"],
        email: json["email"],
        telephoneCountrycode: json["telephone_countrycode"],
        telephone: json["telephone"],
        fax: json["fax"],
        password: json["password"],
        profileUrl: json["profile_url"],
        salt: json["salt"],
        cart: json["cart"],
        wishlist: json["wishlist"],
        newsletter: json["newsletter"],
        addressId: json["address_id"],
        customField: json["custom_field"],
        ip: json["ip"],
        status: json["status"],
        emailVerified: json["email_verified"],
        safe: json["safe"],
        token: json["token"],
        referralToken: json["referral_token"],
        pin: json["pin"],
        code: json["code"],
        isBlocked: json["is_blocked"],
        warningLevel: json["warning_level"],
        blockLiveStream: json["block_live_stream"],
        facebookId: json["facebook_id"],
        uniqueId: json["unique_id"],
        dateAdded: DateTime.parse(json["date_added"]),
        isDelete: json["is_delete"],
        gender: json["gender"],
        praisePopup: json["praise_popup"],
        language: json["language"],
        selectLanguageId: json["select_language_id"],
        googleId: json["google_id"],
        appleId: json["apple_id"],
        referredBy: json["referred_by"],
        lastloginDatetime: json["lastlogin_datetime"],
        userId: json["user_id"],
        refLink: json["ref_link"],
        referId: json["refer_id"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "customer_group_id": customerGroupId,
        "store_id": storeId,
        "language_id": languageId,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "nickname": nickname,
        "email": email,
        "telephone_countrycode": telephoneCountrycode,
        "telephone": telephone,
        "fax": fax,
        "password": password,
        "profile_url": profileUrl,
        "salt": salt,
        "cart": cart,
        "wishlist": wishlist,
        "newsletter": newsletter,
        "address_id": addressId,
        "custom_field": customField,
        "ip": ip,
        "status": status,
        "email_verified": emailVerified,
        "safe": safe,
        "token": token,
        "referral_token": referralToken,
        "pin": pin,
        "code": code,
        "is_blocked": isBlocked,
        "warning_level": warningLevel,
        "block_live_stream": blockLiveStream,
        "facebook_id": facebookId,
        "unique_id": uniqueId,
        "date_added": dateAdded.toIso8601String(),
        "is_delete": isDelete,
        "gender": gender,
        "praise_popup": praisePopup,
        "language": language,
        "select_language_id": selectLanguageId,
        "google_id": googleId,
        "apple_id": appleId,
        "referred_by": referredBy,
        "lastlogin_datetime": lastloginDatetime,
        "user_id": userId,
        "ref_link": refLink,
        "refer_id": referId,
      };
}
