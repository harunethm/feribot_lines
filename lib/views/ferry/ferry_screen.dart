import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/ferry/search_model.dart';
import '../../models/others/key_value_model.dart';
import '../../utils/colors_const.dart';
import '../../utils/strings.dart';
import '../../viewModels/ferry/ferry_screen_vm.dart';
import '../../viewModels/ferry/ferry_vm.dart';
import '../../widgets/custom_drop_down_trip.dart';
import 'ferry_consolidations.dart';

class FerryScreen extends StatelessWidget {
  FerryScreen({Key? key}) : super(key: key);

  final String strBackgroundGif = "assets/images/flight_page.gif";
  final String strDropDownIcon = "assets/images/flight_icon.png";
  final String strSortIcon = "assets/icons/sort_icon.png";
  final Rx<Color> iconColor = ColorsConstants.lightPrimary.obs;

  final FerryScreenVM _vm = Get.put(FerryScreenVM());
  final FerryVM _ferryVM = Get.put(FerryVM());

  @override
  Widget build(BuildContext context) {
    _ferryVM.init();
    _vm.init();
    return Container(
      color: Get.theme.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.userAlt),
                  iconSize: 28,
                  onPressed: () {
                    _ferryVM.openProfile();
                  },
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: Get.theme.backgroundColor,
                  height: Get.size.height * .4,
                  child: Image.asset(strBackgroundGif),
                ),
                SizedBox(
                  height: Get.size.height * 0.01,
                ),
                Text(
                  Strings.bookTrip,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => FaIcon(
                              FontAwesomeIcons.ship,
                              size: 16,
                              color: iconColor.value,
                            ),
                          ),
                          SizedBox(
                            width: Get.size.width * 0.02,
                          ),
                          Container(
                            width: Get.size.width * 0.3,
                            // padding:
                            //     const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(
                              () => CustomDropDownTrip(
                                items: _vm.departurePorts.value,
                                selected: SearchModel.departurePort.value.key,
                                onChanged: (val) {
                                  if (val != null) {
                                    SearchModel.departurePort.value =
                                        _vm.departurePorts.value.firstWhere(
                                      (element) => element.key == val,
                                      orElse: () =>
                                          _vm.departurePorts.value.first,
                                    );

                                    SearchModel.departurePort.refresh();
                                  }
                                  _vm.updateArrivePorts();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 1,
                                color: ColorsConstants.dividerColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: InkWell(
                              onTap: () {
                                toggleWays();
                              },
                              child: Obx(
                                () => Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: iconColor.value,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SearchModel.isOneWay.value
                                            ? const FaIcon(
                                                FontAwesomeIcons.arrowDown,
                                                color: Colors.white,
                                                size: 12,
                                              )
                                            : Image.asset(
                                                strSortIcon,
                                                color: Colors.white,
                                                height: 15,
                                                width: 15,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                toggleWays();
                              },
                              child: Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      SearchModel.isOneWay.value
                                          ? Strings.oneWay
                                          : Strings.twoWay,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      "Değiştirmek için tıklayınız.",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => FaIcon(
                              FontAwesomeIcons.ship,
                              size: 16,
                              color: iconColor.value,
                            ),
                          ),
                          SizedBox(
                            width: Get.size.width * 0.02,
                          ),
                          Container(
                            width: Get.size.width * 0.3,
                            // padding:
                            //     const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(
                              () => CustomDropDownTrip(
                                items: _vm.arrivePorts.value,
                                selected: SearchModel.arrivePort.value.key,
                                onChanged: (val) {
                                  if (val != null) {
                                    SearchModel.arrivePort.value =
                                        _vm.arrivePorts.value[val];
                                    SearchModel.arrivePort.refresh();
                                  }
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            customCalendar(0),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Obx(
                              () => Checkbox(
                                value: SearchModel.isOpenReturn.value,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                activeColor: ColorsConstants.lightAccent,
                                onChanged: (val) {
                                  SearchModel.isOpenReturn.value = val!;
                                  if (val) {
                                    SearchModel.isOneWay.value = false;
                                    iconColor.value =
                                        ColorsConstants.lightPrimary;
                                  } else {
                                    SearchModel.isOneWay.value
                                        ? iconColor.value =
                                            ColorsConstants.lightAccent
                                        : ColorsConstants.lightPrimary;
                                  }
                                },
                                visualDensity: VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.openReturn,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Obx(
                              () => customCalendar(1,
                                  disabled: SearchModel.isOneWay.value ||
                                      SearchModel.isOpenReturn.value),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.size.height * 0.01,
                ),
                SizedBox(height: Get.size.height * .02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _vm.choosePassengers(!_vm.choosePassengers.value);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(
                              () => FaIcon(
                                FontAwesomeIcons.userAlt,
                                size: 16,
                                color: iconColor.value,
                              ),
                            ),
                            Obx(
                              () => Text(
                                _ferryVM.passengersAndCars().value,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Center(
                              child: FaIcon(
                                FontAwesomeIcons.chevronDown,
                                size: 16,
                                color: ColorsConstants.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      indent: 24,
                      endIndent: 24,
                      thickness: 1,
                      color: ColorsConstants.dividerColor,
                    ),
                    Obx(
                      () =>
                          customPassangerCountsCard(_vm.choosePassengers.value),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.size.height * 0.1,
                ),
              ],
            ),
          ),
          bottomNavigationBar: bottomButton(),
        ),
      ),
    );
  }

  void toggleWays() {
    SearchModel.isOneWay(!SearchModel.isOneWay.value);
    SearchModel.isOneWay.value ? SearchModel.isOpenReturn.value = false : null;

    SearchModel.isOneWay.refresh();
    SearchModel.isOpenReturn.refresh();

    iconColor.value = SearchModel.isOneWay.value
        ? ColorsConstants.lightAccent
        : ColorsConstants.lightPrimary;
  }

  InkWell bottomButton() {
    return InkWell(
      onTap: () {
        Get.to(
          () => FerryConsolidations(),
          duration: Duration(milliseconds: 300),
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
              Strings.searchTrip,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  customPassangerCountsCard(bool choosePassenger) {
    return Visibility(
      maintainAnimation: true,
      maintainState: true,
      visible: choosePassenger,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.white,
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: customPassangerCountsDropDown(
                        0,
                        FontAwesomeIcons.userAlt,
                        "Yetişkin",
                        " (12+ Yaş)",
                        items: List.generate(
                          10,
                          (index) => KeyValue(
                            index + 1,
                            (index + 1).toString(),
                          ),
                        ),
                        value: SearchModel.adultCount.value,
                        onChange: (val) {
                          _ferryVM.setCount(0, val!);
                        },
                      ),
                    ),
                    Expanded(
                      child: customPassangerCountsDropDown(
                        1,
                        FontAwesomeIcons.child,
                        "Çocuk",
                        " (6-12 Yaş)",
                        items: List.generate(
                          11,
                          (index) => KeyValue(
                            index,
                            index.toString(),
                          ),
                        ),
                        value: SearchModel.childCount.value,
                        onChange: (val) {
                          _ferryVM.setCount(1, val!);
                        },
                      ),
                    ),
                    Expanded(
                      child: customPassangerCountsDropDown(
                        2,
                        FontAwesomeIcons.babyCarriage,
                        "Bebek",
                        " (0-6 Yaş)",
                        items: List.generate(
                          11,
                          (index) => KeyValue(
                            index,
                            index.toString(),
                          ),
                        ),
                        value: SearchModel.babyCount.value,
                        onChange: (val) {
                          _ferryVM.setCount(2, val!);
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.all(16),
                  color: ColorsConstants.dividerColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: customPassangerCountsDropDown(
                        3,
                        FontAwesomeIcons.car,
                        "Araç Türü",
                        "",
                        items: [
                          KeyValue(0, "Araçsız"),
                          KeyValue(1, "Bisiklet"),
                          KeyValue(2, "Motosiklet"),
                          KeyValue(3, "Otomobil"),
                          KeyValue(4, "Otobüs"),
                          KeyValue(5, "Minibus"),
                        ],
                        value: SearchModel.carType.value,
                        onChange: (val) {
                          _ferryVM.setCount(3, val!);
                        },
                      ),
                    ),
                    Expanded(
                      child: customPassangerCountsDropDown(
                        4,
                        FontAwesomeIcons.car,
                        "Araç Sayısı",
                        "",
                        items: List.generate(
                          11,
                          (index) => KeyValue(
                            index,
                            index.toString(),
                          ),
                        ),
                        value: SearchModel.carCount.value,
                        onChange: (val) {
                          _ferryVM.setCount(4, val!);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  customPassangerCountsDropDown(
    int index,
    IconData icon,
    String text,
    String? subText, {
    required List<KeyValue> items,
    required int value,
    required Function(int? val) onChange,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              size: 16,
              color: iconColor.value,
            ),
            Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: iconColor.value,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                subText != null && subText.isNotEmpty
                    ? Text(
                        subText,
                        style: const TextStyle(
                          color: ColorsConstants.lightGrey,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<int>(
              menuMaxHeight: Get.size.height * .5,
              underline: Container(
                height: 1,
                color: ColorsConstants.dividerColor,
              ),
              icon: const FaIcon(
                FontAwesomeIcons.chevronDown,
                size: 12,
                color: ColorsConstants.grey,
              ),
              dropdownColor: iconColor.value,
              isDense: true,
              items: items
                  .map(
                    (KeyValue e) => DropdownMenuItem<int>(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          e.value,
                          style: TextStyle(
                            color: e.key == value
                                ? SearchModel.isOneWay.value
                                    ? ColorsConstants.lightPrimary
                                    : ColorsConstants.lightAccent
                                : Colors.white,
                            fontSize: e.key == value ? 18 : 14,
                            fontWeight: e.key == value
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      value: e.key,
                    ),
                  )
                  .toList(),
              selectedItemBuilder: (BuildContext con) {
                return items
                    .map(
                      (KeyValue e) => DropdownMenuItem<int>(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            e.value,
                          ),
                        ),
                        value: e.key,
                      ),
                    )
                    .toList();
              },
              value: value,
              onChanged: onChange,
            ),
          ],
        ),
      ],
    );
  }

  customCalendar(
    int index, {
    bool disabled = false,
  }) {
    return InkWell(
      onTap: () {
        showDatePicker(
          locale: const Locale("tr", "TR"),
          context: Get.context!,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: index == 0
              ? SearchModel.departureDate.value
              : SearchModel.arriveDate.value,
          firstDate:
              index == 1 ? SearchModel.departureDate.value : DateTime.now(),
          lastDate: DateTime(2100, 12, 31),
          cancelText: Strings.cancel,
          confirmText: Strings.select,
          currentDate: DateTime.now(),
          helpText: "Tarih Seçin",
        ).then(
          (value) {
            value != null
                ? index == 0
                    ? {
                        SearchModel.departureDate.value = value,
                        SearchModel.departureDate.value
                                .isAfter(SearchModel.arriveDate.value)
                            ? SearchModel.arriveDate.value = value
                            : null
                      }
                    : SearchModel.arriveDate.value = value
                : "";
            SearchModel.arriveDate.refresh();
            SearchModel.departureDate.refresh();
          },
        );
        if (disabled) {
          SearchModel.isOpenReturn.value = false;
          SearchModel.isOneWay.value = false;
          iconColor.value = ColorsConstants.lightPrimary;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.calendarDay,
                        size: 16,
                        color: disabled ? Colors.grey : iconColor.value,
                      ),
                      Text(
                        DateFormat("dd MMM", "tr_TR").format(index == 0
                            ? SearchModel.departureDate.value
                            : SearchModel.arriveDate.value),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: disabled
                              ? Colors.grey
                              : Get.theme.textTheme.bodyText1!.color,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.chevronDown,
                        size: 12,
                        color: disabled ? Colors.grey : Colors.black,
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              color: disabled ? Colors.grey : ColorsConstants.dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
