import 'dart:convert';

class SignUpResponse {
  SignUpResponse({
    this.code,
    this.message,
    this.errors,
    this.userID,
  });

  int? code;
  int? userID;
  String? message;
  String? errors;

  factory SignUpResponse.fromRawJson(String str) => SignUpResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        code: json["code"] ?? -1,
        userID: (json["data"] != null && json["user_id"] != null)
            ? json["data"]["user_id"]
            : -1,
        message: json["message"] ?? "",
        errors: json["errors"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code ?? -1,
        "data": userID ?? -1,
        "message": message ?? "",
        "errors": errors ?? "",
      };
}
