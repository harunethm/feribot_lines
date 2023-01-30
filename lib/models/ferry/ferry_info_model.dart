import 'package:feribot_lines/models/response/ferry/search_trip_response.dart';
import 'package:get/get.dart';
// import 'package:feribot_lines/models/payment/payment_info_model.dart';

class FerryInfoModel {
  static Rx<Trip> sConsolidation = Rx(Trip());
  static Rx<Trip> sReturnConsolidation = Rx(Trip());
}
