// To parse this JSON data, do
//
//     final vieProfileModel = vieProfileModelFromJson(jsonString);

import 'dart:convert';

VieProfileModel vieProfileModelFromJson(String str) =>
    VieProfileModel.fromJson(json.decode(str));

String vieProfileModelToJson(VieProfileModel data) =>
    json.encode(data.toJson());

class VieProfileModel {
  int? status;
  bool? error;
  Messages? messages;

  VieProfileModel({
    this.status,
    this.error,
    this.messages,
  });

  factory VieProfileModel.fromJson(Map<String, dynamic> json) =>
      VieProfileModel(
        status: json["status"],
        error: json["error"],
        messages: json["messages"] == null
            ? null
            : Messages.fromJson(json["messages"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages?.toJson(),
      };
}

class Messages {
  String? responsecode;
  Status? status;

  Messages({
    this.responsecode,
    this.status,
  });

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        responsecode: json["responsecode"],
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "responsecode": responsecode,
        "status": status?.toJson(),
      };
}

class Status {
  String? userId;
  String? fullname;
  dynamic email;
  String? contact;
  bool? isLoggedIn;

  Status({
    this.userId,
    this.fullname,
    this.email,
    this.contact,
    this.isLoggedIn,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        userId: json["user_id"],
        fullname: json["fullname"],
        email: json["email"],
        contact: json["contact"],
        isLoggedIn: json["isLoggedIn"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fullname": fullname,
        "email": email,
        "contact": contact,
        "isLoggedIn": isLoggedIn,
      };
}
