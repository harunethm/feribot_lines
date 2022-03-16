import 'package:get/get.dart';

import 'package:feribot_lines/models/key_value_model.dart';

class ConsolidationModel {
  int consolidationID = 0;
  double price = 0.0;
  KeyValue deperturePort = KeyValue(-1, "");
  KeyValue arrivePort = KeyValue(-1, "");
  DateTime depertureDate = DateTime(2000);
  DateTime arriveDate = DateTime(2000);
  DateTime totalTime = DateTime(1);
  String companyName = "";
  String ferryName = "";
  RxBool isSelected = false.obs;

  ConsolidationModel({
    required this.consolidationID,
    required this.price,
    required this.deperturePort,
    required this.depertureDate,
    required this.arrivePort,
    required this.arriveDate,
    required this.totalTime,
    required this.companyName,
    required this.ferryName,
    required this.isSelected,
  }) {
    consolidationID = 1;
  }
}