import 'dart:convert';

import 'package:feribot_lines/models/others/error.dart';
import 'package:feribot_lines/models/others/user.dart';

class SignInResponse {
  SignInResponse({
    this.code,
    this.message,
    this.error,
    this.user,
  });

  int? code;
  String? message;
  String? error;
  User? user;

  factory SignInResponse.fromRawJson(String str) =>
      SignInResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        code: json["code"] ?? -1,
        message: json["message"] ?? "",
        error: json["errors"] != null
            ? ErrorMessage.fromRawJson(json["errors"]).error
            : "",
        user: json["data"] != null ? User.fromRawJson(json["data"]) : User(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "errors": error,
        "data": user != null ? user!.toJson() : User(),
      };
}
