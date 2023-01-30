import 'package:get/get.dart';

import 'package:feribot_lines/models/others/key_value_model.dart';

class ConsolidationModel {
  int consolidationID = 0;

  double price = 0.0;

  KeyValue departurePort = KeyValue(-1, "");
  KeyValue arrivePort = KeyValue(-1, "");

  DateTime departureDate = DateTime(2000);
  DateTime arriveDate = DateTime(2000);
  DateTime totalTime = DateTime(1);

  String companyName = "";
  String componyImagePath = "";

  String ferryName = "";
  String ferryImagePath = "";

  RxBool isSelected = false.obs;

  ConsolidationModel({
    this.consolidationID = 1,
    required this.price,
    required this.departurePort,
    required this.departureDate,
    required this.arrivePort,
    required this.arriveDate,
    required this.totalTime,
    required this.companyName,
    required this.ferryName,
    required this.isSelected,
  });

  ConsolidationModel.empty();
}
