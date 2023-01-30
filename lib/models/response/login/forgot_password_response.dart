import 'dart:convert';

class ForgotPasswordResponse {
  ForgotPasswordResponse({
    this.title,
    this.text,
    this.icon,
    this.message,
    this.code,
  });

  String? title;
  String? text;
  String? message;
  int? icon;
  int? code;

  factory ForgotPasswordResponse.fromRawJson(String str) =>
      ForgotPasswordResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse(
        title: json["title"] ?? "",
        text: json["text"] ?? "",
        message: json["message"] ?? "",
        icon: json["icon"] ?? -1,
        code: json["code"] ?? -1,
      );

  Map<String, dynamic> toJson() => {
        "title": title ?? "",
        "text": text ?? "",
        "message": message ?? "",
        "icon": icon ?? -1,
        "code": code ?? -1,
      };
}
