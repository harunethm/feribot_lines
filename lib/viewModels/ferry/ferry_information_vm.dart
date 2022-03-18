import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/models/key_value_model.dart';
import 'package:intl/intl.dart';

class FerryInformationVM extends GetxController {
  RxBool confirmSMS = true.obs;

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  RxList<PassengerModel> passengers = RxList();

  List<KeyValue> days = [];
  List<KeyValue> months = [];
  // List<KeyValue> years = List.generate(
  //   151,
  //   (index) {
  //     return KeyValue(
  //       index,
  //       index == 0 ? "Yıl" : (index + 1900).toString().padLeft(2, "0"),
  //     );
  //   },
  // );

  late List<KeyValue> years = [];

  List<KeyValue> nations = [
    KeyValue(90, "Türkiye"),
    KeyValue(30, "Yunanistan"),
    KeyValue(359, "Bulgaristan"),
    KeyValue(994, "Azerbeycan"),
  ];

  init() {
    List<PassengerModel> _temp = [];
    int _pageNumber = 0;
    List.generate(
      SearchModel.adultCount.value,
      (index) => _temp.add(
        PassengerModel(
          title: "Yetişkin ${index + 1}".obs,
          pageNumber: (_pageNumber++).obs,
        ),
      ),
    );
    List.generate(
      SearchModel.childCount.value,
      (index) => _temp.add(
        PassengerModel(
          title: "Çocuk ${index + 1}".obs,
          pageNumber: (_pageNumber++).obs,
        ),
      ),
    );
    List.generate(
      SearchModel.babyCount.value,
      (index) => _temp.add(
        PassengerModel(
          title: "Bebek ${index + 1}".obs,
          pageNumber: (_pageNumber++).obs,
        ),
      ),
    );
    passengers = _temp.obs;

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
  RxString phoneNumber = "".obs;
  RxString eMail = "".obs;
  RxBool confirmSMS = true.obs;

  ContactInfoModel({
    required this.name,
    required this.surName,
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
  RxInt nationalityCode = 90.obs;
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
