import 'package:feribot_lines/models/ferry/consolidation_model.dart';
import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_vm.dart';
import 'package:feribot_lines/viewModels/tab_controller_vm.dart';
import 'package:get/get.dart';

class FerryConsolidationsVM extends GetxController {
  late CustomTabController tabController;
  FerryVM ferryVM = Get.find();

  Rx<List<ConsolidationModel>> consolidations = Rx([]);
  Rx<List<ConsolidationModel>> returnConsolidations = Rx([]);
  RxInt sortType = 0.obs;

  List<String> get tabs {
    return SearchModel.isOneWay.value ? ["Tek Yön"] : ["Gidiş", "Dönüş"];
  }

  init(bool isOneWay, bool isOpenReturn) {
    tabController = Get.put(CustomTabController(active: 0));
    tabController.tabs = tabs;

    ferryVM.searchTrip(0).then((value) => consolidations.value = value);
    consolidations.refresh();

    if (!isOneWay) {
      if (isOpenReturn) {
        returnConsolidations.value = [];
      } else {
        ferryVM
            .searchTrip(1)
            .then((value) => returnConsolidations.value = value);
      }
    } else {
      returnConsolidations.value = [];
    }
  }
}
