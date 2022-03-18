import 'package:feribot_lines/models/ferry/consolidation_model.dart';
import 'package:feribot_lines/models/ferry/ferry_info_model.dart';
import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/models/key_value_model.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_vm.dart';
import 'package:feribot_lines/viewModels/tab_controller_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/ferry_services.dart';

class FerryConsolidationsVM extends GetxController {
  late CustomTabController tabController;
  FerryVM ferryVM = Get.find();

  Rx<List<ConsolidationModel>> consolidations = Rx([]);
  Rx<List<ConsolidationModel>> returnConsolidations = Rx([]);

  RxInt sortType = 0.obs;
  List<KeyValue> sortTypes = [
    KeyValue(0, "Kalkış Saati"),
    KeyValue(1, "Varış Saati"),
    KeyValue(2, "Sefer Süresi"),
    KeyValue(3, "Fiyat"),
  ];
  List<String> get tabs {
    return SearchModel.isOneWay.value ? ["Tek Yön"] : ["Gidiş", "Dönüş"];
  }

  void searchTrip(int tripIndex /* 0 => gidiş, 1 => dönüş */) {
    debugPrint("statement 1");
    if (tripIndex == 0) {
      debugPrint("statement 2");
      FerryServices.searchTrip(0).then((value) {
        debugPrint("searchTrip 0 end");
        consolidations.value = value;
      });
    } else if (tripIndex == 1) {
      debugPrint("statement 3");
      FerryServices.searchTrip(1).then((value) {
        debugPrint("searchTrip 1 end");
        returnConsolidations.value = value;
      });
    }
    debugPrint("statement 4");
  }

  init() {
    debugPrint("statement a");
    tabController = Get.put(CustomTabController(active: 0));
    tabController.tabs = tabs;

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      searchTrip(0);

      if (!SearchModel.isOneWay.value && !SearchModel.isOpenReturn.value) {
        searchTrip(1);
      } else {
        returnConsolidations.value = [];
      }

      consolidations.refresh();
      returnConsolidations.refresh();
    });
  }

  void selectConsolidation(ConsolidationModel? item) {
    if (tabController.activeTab.value == 0) {
      FerryInfoModel.sConsolidation.value = item ?? ConsolidationModel.empty();
    } else if (tabController.activeTab.value == 1) {
      FerryInfoModel.sReturnConsolidation.value =
          item ?? ConsolidationModel.empty();
    }

    if (!SearchModel.isOneWay.value && item != null) {
      if (tabController.activeTab.value == 0 &&
          FerryInfoModel.sReturnConsolidation.value.consolidationID == 0) {
        tabController.activeTab.value = 1;
      } else if (tabController.activeTab.value == 1 &&
          FerryInfoModel.sConsolidation.value.consolidationID == 0) {
        tabController.activeTab.value = 0;
      }

      tabController.pageController.animateToPage(
        tabController.activeTab.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // executes after build completed
      consolidations.refresh();
      returnConsolidations.refresh();
    });
  }
}
