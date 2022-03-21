import 'dart:convert';

import 'package:feribot_lines/models/login/login_model.dart';
import 'package:feribot_lines/models/login/register_model.dart';
import 'package:feribot_lines/models/response_model.dart';
import 'package:feribot_lines/models/user.dart';
import 'package:feribot_lines/utils/paths.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static Future<ResponseModel> login(String userName, String password) async {
    // Future.delayed(const Duration(seconds: 2)).then((value) {
    //   userName = "citija4941@siberpay.com";
    //   password = "123456";
    //   Uri url = Uri.parse(Path.loginURL);
    //   String basicAuth =
    //       'Basic ' + base64Encode(utf8.encode('$userName:$password'));

    //   // http.Response response = await
    //   http.get(
    //     url,
    //     headers: <String, String>{'authorization': basicAuth},
    //   ).then((http.Response value) => print(value.statusCode));

    //   return ResponseModel(error: false, errorMessage: "", data: ["user1"]);
    // });

    await Future.delayed(const Duration(seconds: 2));
    return ResponseModel(
      error: false,
      errorMessage: "",
      data: LoginModel()
        ..name = "test"
        ..password = "test2",
    );
  }

  static Future<ResponseModel> register(RegisterModel model) async {
    // Future.delayed(const Duration(seconds: 2)).then((value) async {
    //   Uri url = Uri.parse(Path.registerURL);
    //   String basicAuth = 'Basic ' + base64Encode(utf8.encode('$model:$model'));

    //   http.Response response = await http.get(
    //     url,
    //     headers: <String, String>{'authorization': basicAuth},
    //   );

    //   return ResponseModel(error: false, errorMessage: "", data: ["user1"]);
    // });
    await Future.delayed(const Duration(seconds: 2));
    return ResponseModel(
      error: false,
      errorMessage: "",
      data: true,
    );
  }

  static Future<ResponseModel> forgotPassword(String eMail) async {
    // Future.delayed(const Duration(seconds: 2)).then((value) async {
    //   Uri url = Uri.parse(Path.registerURL);
    //   String basicAuth = 'Basic ' + base64Encode(utf8.encode('$eMail'));

    //   http.Response response = await http.get(
    //     url,
    //     headers: <String, String>{'authorization': basicAuth},
    //   );

    //   return ResponseModel(error: false, errorMessage: "", data: ["user1"]);
    // });
    await Future.delayed(const Duration(seconds: 2));
    return ResponseModel(
      error: false,
      errorMessage: "",
      data: true,
    );
  }

  static bool logOut() {
    // Future.delayed(const Duration(seconds: 2)).then((value) async {
    //   Uri url = Uri.parse(Path.registerURL);
    //   String basicAuth = 'Basic ' + base64Encode(utf8.encode('$eMail'));

    //   http.Response response = await http.get(
    //     url,
    //     headers: <String, String>{'authorization': basicAuth},
    //   );

    //   return ResponseModel(error: false, errorMessage: "", data: ["user1"]);
    // });
    USER.isLogined = false;
    return true;
  }
}
