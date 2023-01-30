import 'dart:convert';

import 'package:package_info_plus/package_info_plus.dart';

class API {
  static const String baseApiUrl = "https://ferryhunter.nt/api";
  static const String baseUrl = "https://ferryhunter.nt/";

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
  String _username = '';
  String _password = '';
  String _basicAuth =
      'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
  return _basicAuth;
}
