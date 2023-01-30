import 'dart:convert';

import 'package:package_info_plus/package_info_plus.dart';

class API {
  static const String baseApiUrl = "https://ferryhunter.net/api";
  static const String baseUrl = "https://ferryhunter.net/";

  static const String departurePorts = "/departure-seaports";
  static const String arrivePorts = "/return-seaports";
  static const String exchanges = "/exchanges";
  static const String nationalities = "/nationalities";
  static const String cities = "/cities";
  static const String searchTrip = "/search";
  static const String order = "/order";
  static const String signIn = "/user-signin";
  static const String signUp = "/user-signup";
  static const String userForgotPassword = "/user-forgot-password";
  static const String userInfo = "/user-info";
  static const String tickets = "/user/tickets";

  static final Map<String, String> headers = {
    "accept": "*/*",
    "user-agent":
        "${PackageInfo.fromPlatform().then((value) => value.appName + "/" + value.version + "-" + value.buildNumber)}",
    "authorization": _basicAuth(),
  };
}

_basicAuth() {
  String _username =
      '749d571bb83abb63898dc7b058de8fadc4f4d5b731f4f72c0080fb41102b6ccf';
  String _password =
      '170404b724f2828169b20d9deae0ae033db2456900d5600553d55654d2f3e5a5';
  String _basicAuth =
      'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
  return _basicAuth;
}
