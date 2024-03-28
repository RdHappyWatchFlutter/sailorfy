// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  int code;
  String message;
  Data data;

  LoginResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    code: json["code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int messageId;
  String number;

  Data({
    required this.messageId,
    required this.number,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    messageId: json["message_id"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "message_id": messageId,
    "number": number,
  };
}
