import 'dart:convert';

class ErrorMessage {
  ErrorMessage({
    this.error,
  });

  String? error;

  factory ErrorMessage.fromRawJson(String str) =>
      ErrorMessage.fromJson(json.decode(str));

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      // String _error = "";
      // errorTypes.forEach((element) {
      //   if (json[element] != null) {
      //     _error = element;
      //   }
      // });
      ErrorMessage(
        error: errorTypes.firstWhere(
          (element) => json[element] != null,
          orElse: () => "",
        ),
      );
}

List<String> errorTypes = [
  "session",
  "http",
  "email",
  "password",
];
