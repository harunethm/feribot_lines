import 'package:feribot_lines/models/ferry/consolidation_model.dart';
import 'package:feribot_lines/models/ferry/ferry_info_model.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_information_vm.dart';

class TicketModel {
  late ConsolidationModel consolidation;
  late ConsolidationModel returnConsolidation;

  late ContactInfoModel contactInfo;

  // List<PassengerModel> passengers = List<PassengerModel>();

  TicketModel() {
    consolidation = FerryInfoModel.sConsolidation.value;
    returnConsolidation = FerryInfoModel.sReturnConsolidation.value;
    contactInfo = ContactInfoModel.createEmpty();
  }
}
