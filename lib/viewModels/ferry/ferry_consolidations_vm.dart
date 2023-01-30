import 'package:feribot_lines/models/ferry/ferry_info_model.dart';
import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/models/others/key_value_model.dart';
import 'package:feribot_lines/models/response/ferry/search_trip_response.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_vm.dart';
import 'package:feribot_lines/viewModels/tab_controller_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/ferry_services.dart';
import 'ferry_information_vm.dart';

class FerryConsolidationsVM extends GetxController {
  late CustomTabController tabController;
  FerryVM ferryVM = Get.find();
  FerryInformationVM infoVM = Get.find();

  RxBool isLoadingConsolidations = false.obs;
  RxBool isLoadingReturnConsolidations = false.obs;

  Rx<List<Trip>> consolidations = Rx([]);
  Rx<List<Trip>> returnConsolidations = Rx([]);

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

  void searchTrip() {
    FerryServices.searchTrip().then((value) {
      consolidations.value = value.departureModel ?? [];
      returnConsolidations.value = value.returnModel ?? [];
    });
    isLoadingConsolidations.value = false;
    isLoadingReturnConsolidations.value = false;
  }

  void clear() {
    isLoadingConsolidations.value = false;
    isLoadingReturnConsolidations.value = false;
    consolidations.value = [];
    returnConsolidations.value = [];
    FerryInfoModel.sConsolidation.value = Trip();
    FerryInfoModel.sReturnConsolidation.value = Trip();
  }

  init() {
    tabController = Get.put(CustomTabController(active: 0));
    tabController.tabs = tabs;
    FerryInfoModel.sConsolidation.value = Trip();
    FerryInfoModel.sReturnConsolidation.value = Trip();
    isLoadingConsolidations.value = true;
    isLoadingReturnConsolidations.value = true;

    List<InfoModel> _temp = [];
    int _pageNumber = 0;
    List.generate(
      SearchModel.adultCount.value,
      (index) => _temp.add(
        InfoModel(
          title: "Yetişkin ${index + 1}".obs,
          pageNumber: (_pageNumber++),
        ),
      ),
    );
    List.generate(
      SearchModel.childCount.value,
      (index) => _temp.add(
        InfoModel(
          title: "Çocuk ${index + 1}".obs,
          pageNumber: (_pageNumber++),
        ),
      ),
    );
    List.generate(
      SearchModel.babyCount.value,
      (index) => _temp.add(
        InfoModel(
          title: "Bebek ${index + 1}".obs,
          pageNumber: (_pageNumber++),
        ),
      ),
    );
    infoVM.passengers = _temp.obs;

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      searchTrip();

      consolidations.refresh();
      returnConsolidations.refresh();
    });
  }

  void selectConsolidation(Trip? item) {
    if (tabController.activeTab.value == 0) {
      FerryInfoModel.sConsolidation.value = item ?? Trip();
    } else if (tabController.activeTab.value == 1) {
      FerryInfoModel.sReturnConsolidation.value = item ?? Trip();
    }

    if (!SearchModel.isOneWay.value && item != null) {
      if (tabController.activeTab.value == 0 &&
          FerryInfoModel.sReturnConsolidation.value.expeditionId == null) {
        tabController.activeTab.value = 1;
      } else if (tabController.activeTab.value == 1 &&
          FerryInfoModel.sConsolidation.value.expeditionId == null) {
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
