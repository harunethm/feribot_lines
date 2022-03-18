import 'package:feribot_lines/models/ferry/consolidation_model.dart';
import 'package:get/get.dart';
// import 'package:feribot_lines/models/payment/payment_info_model.dart';

class FerryInfoModel {
  static Rx<ConsolidationModel> sConsolidation = Rx(ConsolidationModel.empty());
  static Rx<ConsolidationModel> sReturnConsolidation =
      Rx(ConsolidationModel.empty());
}
