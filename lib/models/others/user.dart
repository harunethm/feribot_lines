import 'dart:convert';

import 'package:get/get.dart';

class User {
  User({
    this.id,
    this.verified,
    this.registered,
    this.lastLogin,
    DateTime? birthday,
    this.email = "",
    this.username = "",
    this.firstname = "",
    this.lastname = "",
    this.country,
    int? countryCode,
    String? gender,
    this.identitynumber = "",
    int? phoneCode,
    this.phone = "",
    this.passportnumber = "",
    this.passportexpire = "",
    String? smsperm,
    String? mailperm,
  }) {
    this.birthday = birthday != null ? birthday.obs : DateTime.now().obs;
    this.countryCode = countryCode != null ? countryCode.obs : (-1).obs;
    this.gender = gender != null ? gender.obs : "".obs;
    this.phoneCode = phoneCode != null ? phoneCode.obs : (-1).obs;
    this.smsperm = smsperm != null ? smsperm.obs : "".obs;
    this.mailperm = mailperm != null ? mailperm.obs : "".obs;
  }

  int? id;
  int? verified;
  int? registered;
  int? lastLogin;
  Rx<DateTime>? birthday;
  String? email;
  String? username;
  String? firstname;
  String? lastname;
  RxInt countryCode = (-1).obs;
  String? country;
  RxString gender = "".obs;
  String? identitynumber;
  RxInt phoneCode = (-1).obs;
  String? phone;
  String? passportnumber;
  String? passportexpire;
  RxString smsperm = "".obs;
  RxString mailperm = "".obs;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? -1,
        verified: json["verified"] ?? -1,
        registered: (json["registered"] ?? -1).obs,
        lastLogin: json["last_login"] ?? -1,
        birthday: DateTime.parse(json["birthday"] ?? "1234-12-12"),
        email: json["email"] ?? "",
        username: json["username"] ?? "",
        firstname: json["firstname"] ?? "",
        lastname: json["lastname"] ?? "",
        countryCode: 90,
        country: (json["country"] ?? "").obs,
        gender: (json["gender"] ?? "").obs,
        identitynumber: json["identitynumber"] ?? "",
        phoneCode: ((json["phone"] ?? "-01").substring(0, 3)).obs,
        phone: (json["phone"] ?? "").substring(3),
        passportnumber: json["passportnumber"] ?? "",
        passportexpire: json["passportexpire"] ?? "",
        smsperm: (json["smsperm"] ?? "").obs,
        mailperm: (json["mailperm"] ?? "").obs,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? -1,
        "verified": verified ?? -1,
        "registered": (registered ?? -1).obs,
        "last_login": lastLogin ?? -1,
        "birthday": birthday != null
            ? "${birthday!.value.year.toString().padLeft(2, '0')}-${birthday!.value.month.toString().padLeft(2, '0')}-${birthday!.value.day.toString().padLeft(2, '0')}"
            : "",
        "email": email ?? "",
        "username": username ?? "",
        "firstname": firstname ?? "",
        "lastname": lastname ?? "",
        "country": country ?? "",
        "gender": (gender).value,
        "identitynumber": identitynumber ?? "",
        "phone": (phoneCode).value.toString() + (phone ?? ""),
        "passportnumber": passportnumber ?? "",
        "passportexpire": passportexpire ?? "",
        "smsperm": (smsperm).value,
        "mailperm": (mailperm).value,
      };
}
