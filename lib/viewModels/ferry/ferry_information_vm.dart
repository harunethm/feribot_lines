import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:feribot_lines/models/others/key_value_model.dart';
import 'package:feribot_lines/models/others/user.dart';
import 'package:feribot_lines/services/ferry_services.dart';

class FerryInformationVM extends GetxController {
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  RxList<InfoModel> passengers = RxList();
  User contactInfo = User();

  List<KeyValue> days = [];
  List<KeyValue> months = [];
  List<KeyValue> years = [];

  List<KeyValue> phoneCodes = [
    KeyValue(-1, "Seçiniz"),
    KeyValue(90, "Türkiye +90"),
    KeyValue(1, "US +1"),
    KeyValue(1684, "American Samoa +1684"),
    KeyValue(355, "Albenia +355"),
  ];

  RxList<KeyValue> nations = RxList([KeyValue(-1, "Seçiniz")]);

  void getNations() async {
    await FerryServices.getCountries().then(
      (value) => nations.value = value
          .map(
            (e) =>
                KeyValue(int.parse(e.countryCode ?? "0"), e.countryName ?? ""),
          )
          .toList(),
    );
  }

  init() {
    // getNations();
    days = List.generate(
      31,
      (index) {
        return KeyValue(
          index + 1,
          (index + 1).toString(),
        );
      },
    );
    months = List.generate(
      12,
      (index) {
        return KeyValue(
          index + 1,
          DateFormat("MMMM", "tr_TR").format(DateTime(1, index + 1)),
        );
      },
    );
    years.clear();
    for (int i = DateTime.now().year; i > 1900; i--) {
      years.add(KeyValue(i, i.toString()));
    }
  }
}

class ContactInfoModel {
  RxString name = "".obs;
  RxString surName = "".obs;
  RxInt phoneCode = 90.obs;
  RxString phoneNumber = "".obs;
  RxString eMail = "".obs;
  RxBool confirmSMS = true.obs;

  ContactInfoModel({
    required this.name,
    required this.surName,
    required this.phoneCode,
    required this.phoneNumber,
    required this.eMail,
    required this.confirmSMS,
  });

  ContactInfoModel.createEmpty();
}

class PassengerModel {
  RxString title = "".obs;
  RxInt pageNumber = 0.obs;

  RxString name = "".obs;
  RxString surName = "".obs;
  RxBool genderIsMale = true.obs;
  RxInt birthDay = 1.obs;
  RxInt birthMonth = 1.obs;
  RxInt birthYear = DateTime.now().year.obs;
  RxInt nationalityCode = 0.obs;
  RxString passportNumber = "".obs;
  RxString identificationNumber = "".obs;

  PassengerModel({
    required this.title,
    required this.pageNumber,
    RxString? name,
    RxString? surName,
    RxBool? genderIsMale,
    RxString? passportNumber,
    RxString? identificationNumber,
    RxInt? birthDay,
    RxInt? birthMonth,
    RxInt? birthYear,
    RxInt? nationalityCode,
  }) {
    this.name = name ?? "".obs;
    this.surName = surName ?? "".obs;
    this.genderIsMale = true.obs;
    this.passportNumber = passportNumber ?? "".obs;
    this.identificationNumber = identificationNumber ?? "".obs;
    this.birthDay = birthDay ?? 1.obs;
    this.birthMonth = birthMonth ?? 1.obs;
    this.birthYear = birthYear ?? DateTime.now().year.obs;
    this.nationalityCode = nationalityCode ?? 90.obs;
  }

  PassengerModel.createEmpty();
}

class InfoModel {
  int pageNumber = 0;
  RxString title = "".obs;
  User user = User();

  InfoModel({
    required this.pageNumber,
    required this.title,
  });
}
