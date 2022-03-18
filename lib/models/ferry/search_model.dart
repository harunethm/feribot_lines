import 'package:feribot_lines/models/key_value_model.dart';
import 'package:get/get.dart';

class SearchModel {
  static Rx<KeyValue> deperturePort = Rx(KeyValue(0, ""));
  static Rx<KeyValue> arrivePort = Rx(KeyValue(0, ""));

  static RxBool isOneWay = false.obs;
  static RxBool isOpenReturn = false.obs;

  static Rx<DateTime> depertureDate = DateTime.now().obs;
  static Rx<DateTime> arriveDate = DateTime.now().obs;

  static RxInt adultCount = 1.obs;
  static RxInt childCount = 0.obs;
  static RxInt babyCount = 0.obs;

  static RxInt carType = 0.obs;
  static RxInt carCount = 0.obs;
}
