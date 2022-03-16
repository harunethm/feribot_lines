import 'package:feribot_lines/models/ferry/consolidation_model.dart';
import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_vm.dart';
import 'package:feribot_lines/viewModels/tab_controller_vm.dart';
import 'package:feribot_lines/views/ferry/ferry_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FerryConsolidationsVM extends GetxController {
  late CustomTabController tabController;
  FerryVM ferryVM = Get.find();

  Rx<List<ConsolidationModel>> consolidations = Rx([]);
  Rx<List<ConsolidationModel>> returnConsolidations = Rx([]);

  RxInt selectedConsolidationID = 0.obs;
  RxInt selectedReturnConsolidationID = 0.obs;

  RxInt sortType = 0.obs;
  List<String> get tabs {
    return SearchModel.isOneWay.value ? ["Tek Yön"] : ["Gidiş", "Dönüş"];
  }

  init() {
    tabController = Get.put(CustomTabController(active: 0));
    tabController.tabs = tabs;

    selectedConsolidationID.value = 0;
    selectedReturnConsolidationID.value = 0;

    ferryVM.searchTrip(0).then((value) => consolidations.value = value);
    consolidations.refresh();

    if (!SearchModel.isOneWay.value) {
      if (SearchModel.isOpenReturn.value) {
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

  void selectConsolidation(int ID) {
    if (tabController.activeTab.value == 0) {
      // gidiş
      selectedConsolidationID.value = ID;
    } else if (tabController.activeTab.value == 1) {
      // dönüş
      selectedReturnConsolidationID.value = ID;
    }

    if (ID != 0 && !SearchModel.isOneWay.value) {
      if (tabController.activeTab.value == 0 &&
          selectedReturnConsolidationID.value == 0) {
        tabController.activeTab.value = 1;
      } else if (tabController.activeTab.value == 1 &&
          selectedConsolidationID.value == 0) {
        tabController.activeTab.value = 0;
      }

      tabController.pageController.animateToPage(
        tabController.activeTab.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
