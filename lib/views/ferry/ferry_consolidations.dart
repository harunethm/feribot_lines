import 'package:feribot_lines/models/ferry/consolidation_model.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_vm.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/ferry/search_model.dart';
import '../../models/key_value_model.dart';
import '../../utils/colors_const.dart';
import '../../utils/common_functions.dart';
import '../../utils/strings.dart';
import '../../viewModels/ferry/ferrt_consolidations_vm.dart';
import '../../widgets/custom_dropdown_sort.dart';
import '../../widgets/custom_tabs.dart';
import '../../widgets/ferry_details.dart';
import '../../widgets/ferry_ticket.dart';

class FerryConsolidations extends StatelessWidget {
  FerryConsolidations({
    Key? key,
  }) : super(key: key);

  final FerryConsolidationsVM _vm = Get.put(FerryConsolidationsVM());
  // final FerryVM _ferryVM = Get.find();

  @override
  Widget build(BuildContext context) {
    _vm.init(SearchModel.isOneWay.value, SearchModel.isOpenReturn.value);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.userAlt,
              size: 20,
            ),
            onPressed: () {
              CommonFunctions.openProfile();
            },
          ),
        ],
        backgroundColor: ColorsConstants.lightPrimary,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: Get.size.height * .4,
            decoration: const BoxDecoration(
              color: ColorsConstants.lightPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45.0),
                bottomRight: Radius.circular(45.0),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              FerryDetails(
                from: SearchModel.deperturePort.value.value.toString(),
                to: SearchModel.arrivePort.value.value.toString(),
                date: DateFormat("d MMMM", "tr_TR")
                    .format(SearchModel.depertureDate.value),
              ),
              const SizedBox(height: 10.0),
              sortingDetailsAndPassengerCounts(),
              const SizedBox(height: 20.0),
              CustomTabs(
                onChange: () {},
                tabController: _vm.tabController,
              ),
              Expanded(
                child: Obx(
                  () => PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _vm.tabController.pageController,
                    onPageChanged: (int page) {
                      _vm.tabController.activeTab(page);
                    },
                    children: [
                      FerryTicketsList(_vm.consolidations.value),
                      if (!SearchModel.isOneWay.value)
                        FerryTicketsList(_vm.returnConsolidations.value),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  sortingDetailsAndPassengerCounts() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Text(
                    'Sırala:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Obx(
                    () => CustomDropDown(
                      items: [
                        KeyValue(0, "Fiyat"),
                        KeyValue(1, "Sefer Süresi"),
                        KeyValue(2, "Varış Saati"),
                        KeyValue(3, "Kalkış Saati"),
                      ],
                      value: _vm.sortType.value,
                      onChange: (val) {
                        _vm.sortType.value = val!;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SearchModel.adultCount.value > 0
                      ? personIcon(
                          FontAwesomeIcons.user, SearchModel.adultCount.value)
                      : const SizedBox.shrink(),
                  SearchModel.childCount.value > 0
                      ? personIcon(
                          FontAwesomeIcons.child, SearchModel.childCount.value)
                      : const SizedBox.shrink(),
                  SearchModel.babyCount.value > 0
                      ? personIcon(FontAwesomeIcons.babyCarriage,
                          SearchModel.babyCount.value)
                      : const SizedBox.shrink(),
                  SearchModel.carCount.value > 0
                      ? personIcon(
                          FontAwesomeIcons.car, SearchModel.carCount.value)
                      : const SizedBox.shrink(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget personIcon(IconData icon, int count) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            // color: ColorsConstants.lightPrimary.withAlpha(40),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(8),
          child: FaIcon(
            icon,
            size: 20,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: 16.0,
            width: 16.0,
            decoration: BoxDecoration(
              color: ColorsConstants.lightAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class FerryTicketsList extends StatelessWidget {
  List<ConsolidationModel> data;
  FerryTicketsList(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? ListView(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            children: data
                .map(
                  (item) => FerryTicket(
                    price: item.price,
                    deperturePort: item.deperturePort.value,
                    arrivePort: item.arrivePort.value,
                    departureTime:
                        DateFormat("hh:mm", "tr_TR").format(item.depertureDate),
                    departureDate: DateFormat("dd MMM EEE", "tr_TR")
                        .format(item.depertureDate),
                    arrivalTime:
                        DateFormat("hh:mm", "tr_TR").format(item.arriveDate),
                    arrivalDate: DateFormat("dd MMM EEE", "tr_TR")
                        .format(item.arriveDate),
                    totalTime:
                        DateFormat("hh", "tr_TR").format(item.totalTime) +
                            " Saat " +
                            DateFormat("mm", "tr_TR").format(item.totalTime) +
                            " Dakika",
                    companyName: item.companyName,
                    companyLogoPath: "",
                    ferryName: item.ferryName,
                    isSelected: false,
                    
                  ),
                )
                .toList(),
          )
        : Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              color: Get.theme.backgroundColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/icon_acik_tarih.png"),
                        const Text(
                          "Dönüş biletiniz açık tarihlidir.",
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => FerryConsolidations(),
                        duration: const Duration(milliseconds: 300),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 16, right: 16, left: 16),
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorsConstants.lightPrimary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.continueText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
