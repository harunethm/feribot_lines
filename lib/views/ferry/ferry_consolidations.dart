import 'package:feribot_lines/models/ferry/ferry_info_model.dart';
import 'package:feribot_lines/views/ferry/ferry_information.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/ferry/search_model.dart';
import '../../utils/colors_const.dart';
import '../../utils/strings.dart';
import '../../viewModels/ferry/ferry_consolidations_vm.dart';
import '../../viewModels/ferry/ferry_vm.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_tabs.dart';
import '../../widgets/ferry_details.dart';
import '../../widgets/ferry_tickets_list.dart';

class FerryConsolidations extends StatelessWidget {
  FerryConsolidations({
    Key? key,
  }) : super(key: key);

  final FerryConsolidationsVM _vm = Get.put(FerryConsolidationsVM());
  final FerryVM _ferryVM = Get.find();

  @override
  Widget build(BuildContext context) {
    _vm.init();
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          iconSize: 20,
          splashRadius: 24,
          onPressed: () {
            _vm.clear();
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.userAlt),
            iconSize: 20,
            splashRadius: 24,
            onPressed: () {
              _ferryVM.openProfile();
            },
          ),
        ],
        backgroundColor: ColorsConstants.lightPrimary,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Stack(
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
                  from: SearchModel.departurePort.value.value.toString(),
                  to: SearchModel.arrivePort.value.value.toString(),
                  fromDate: DateFormat("d MMMM", "tr_TR")
                      .format(SearchModel.departureDate.value),
                  toDate: DateFormat("d MMMM", "tr_TR")
                      .format(SearchModel.arriveDate.value),
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
                        !_vm.isLoadingConsolidations.value
                            ? _vm.consolidations.value.isNotEmpty
                                ? Obx(() =>
                                    FerryTicketsList(_vm.consolidations.value))
                                : Container()
                            : noTripValue(),
                        !_vm.isLoadingReturnConsolidations.value
                            ? _vm.returnConsolidations.value.isEmpty
                                ? noTripValue()
                                : Obx(() => FerryTicketsList(
                                    _vm.returnConsolidations.value))
                            : !SearchModel.isOneWay.value &&
                                    !SearchModel.isOpenReturn.value
                                ? Obx(
                                    () => FerryTicketsList(
                                      _vm.returnConsolidations.value,
                                    ),
                                  )
                                : !SearchModel.isOneWay.value &&
                                        SearchModel.isOpenReturn.value
                                    ? openReturnCard()
                                    : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomButton(),
    );
  }

  Widget openReturnCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        color: Get.theme.backgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/icon_acik_tarih.png"),
            SizedBox(
              height: Get.size.height * .01,
            ),
            const Text(
              "Dönüş biletiniz açık tarihlidir.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget noTripValue() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        color: Get.theme.backgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 32),
            SizedBox(
              height: Get.size.height * .01,
            ),
            const Text(
              "Aradığınız kriterde sefer bulunamadı.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTrip() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        color: Get.theme.backgroundColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FaIcon(Icons.search_rounded, size: 32),
            SizedBox(
              height: Get.size.height * .01,
            ),
            const Text(
              "Sefer aranıyor ...",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sortingDetailsAndPassengerCounts() {
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
                      items: _vm.sortTypes,
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

  Widget bottomButton() {
    return Obx(
      () => Visibility(
        visible: (FerryInfoModel.sConsolidation.value.expeditionId != null &&
            FerryInfoModel.sConsolidation.value.expeditionId != -1 &&
            (FerryInfoModel.sReturnConsolidation.value.expeditionId != null &&
                    FerryInfoModel.sReturnConsolidation.value.expeditionId !=
                        -1 ||
                SearchModel.isOneWay.value ||
                SearchModel.isOpenReturn.value)),
        child: InkWell(
          onTap: () {
            Get.to(
              () => FerryInformation(),
              duration: const Duration(milliseconds: 300),
              transition: Transition.rightToLeft,
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
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
        ),
      ),
    );
  }
}
