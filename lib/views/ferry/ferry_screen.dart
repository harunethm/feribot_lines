import 'package:feribot_lines/viewModels/tab_controller_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors_const.dart';
import '../../utils/common_functions.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_drop_down_trip.dart';
import 'ferry_services.dart';

class FerryScreen extends StatelessWidget {
  FerryScreen({Key? key}) : super(key: key);

  final String strBackgroundGif = "assets/images/flight_page.gif";
  final String strDropDownIcon = "assets/images/flight_icon.png";
  final String strSortIcon = "assets/icons/sort_icon.png";

  RxBool isOneWay = false.obs;
  RxBool isOpenReturn = false.obs;
  RxBool choosePassengers = false.obs;

  final List<String> _oneWayTab = ["Tek Yön"];
  final List<String> _twoWayTab = ["Gidiş", "Dönüş"];

  CustomTabController tabController =
      Get.put(CustomTabController(), tag: "ferryScreen");

  @override
  Widget build(BuildContext context) {
    tabController.tabs = isOneWay.value ? _oneWayTab : _twoWayTab;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              iconSize: 32,
              onPressed: () {
                CommonFunctions.openProfile();
              },
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
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                        // Image.asset(
                        //   strDropDownIcon,
                        //   height: 30,
                        //   width: 30,
                        //   color: Colors.grey,
                        // ),
                        Obx(
                          () => Icon(
                            Icons.directions_ferry_rounded,
                            size: 20,
                            color: isOneWay.value
                                ? ColorsConstants.lightPrimary
                                : ColorsConstants.lightAccent,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: Get.size.width * .3,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomDropDownTrip(items: [
                            "Fethiye",
                            "Atina",
                            "Ayvalık",
                            "Bodrum",
                            "Çeşme",
                            "Didim",
                          ]),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () {
                              isOneWay.value = !isOneWay.value;
                              tabController.tabs =
                                  isOneWay.value ? _oneWayTab : _twoWayTab;
                            },
                            child: Obx(
                              () => Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: isOneWay.value
                                          ? ColorsConstants.lightAccent
                                          : ColorsConstants.lightPrimary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: isOneWay.value
                                          ? Icon(
                                              Icons.arrow_downward_rounded,
                                              color: Colors.white,
                                              size: 15,
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
                              isOneWay.value = !isOneWay.value;
                            },
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isOneWay.value
                                        ? Strings.oneWay
                                        : Strings.twoWay,
                                    style: titleStyle,
                                  ),
                                  Text(
                                    "Değiştirmek için tıklayınız.",
                                    style: subtitleStyle,
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
                        // Image.asset(
                        //   strDropDownIcon,
                        //   height: 30,
                        //   width: 30,
                        //   color: Colors.grey,
                        // ),
                        Obx(
                          () => Icon(
                            Icons.directions_ferry_rounded,
                            size: 20,
                            color: isOneWay.value
                                ? ColorsConstants.lightPrimary
                                : ColorsConstants.lightAccent,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: Get.size.width * .3,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomDropDownTrip(items: [
                            "Paros",
                            "Patmos",
                            "Rodos",
                            "Sakarya",
                            "Sarız",
                            "Samoz",
                            "Patmos",
                            "Rodos",
                            "Sakarya",
                            "Sarız",
                            "Samoz",
                            "Patmos",
                            "Rodos",
                            "Sakarya",
                            "Sarız",
                            "Samoz",
                          ]),
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
                          customCalendar(),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              value: isOpenReturn.value,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              activeColor: ColorsConstants.lightAccent,
                              onChanged: !isOneWay.value
                                  ? (val) {
                                      isOpenReturn.value = val!;
                                    }
                                  : null,
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
                              "Açık Dönüş",
                              style: TextStyle(
                                  color: isOneWay.value
                                      ? Colors.grey
                                      : Colors.black),
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
                            () => customCalendar(
                              disabled: ((isOneWay.value ||
                                  !isOneWay.value && isOpenReturn.value)),
                            ),
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
                      choosePassengers(!choosePassengers.value);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.person,
                            color: ColorsConstants.lightPrimary,
                          ),
                          Text(
                            "3 Yolcu, Araçsız",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: ColorsConstants.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    indent: 24,
                    endIndent: 24,
                    thickness: 1,
                    color: ColorsConstants.dividerColor,
                  ),
                  Obx(() => customPassangerCountsCard(choosePassengers.value)),
                ],
              ),
              SizedBox(
                height: Get.size.height * 0.1,
              ),
            ],
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Get.to(
              () => FerryServices(),
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
                          Icons.person, "Yetişkin", " (12+ Yaş)"),
                    ),
                    Expanded(
                      child: customPassangerCountsDropDown(
                          Icons.child_care, "Çocuk", " (6-12 Yaş)"),
                    ),
                    Expanded(
                      child: customPassangerCountsDropDown(
                          Icons.child_friendly, "Bebek", " (0-6 Yaş)"),
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
                        Icons.drive_eta_rounded,
                        "Araç Türü",
                        "",
                        items: [
                          "Araçsız",
                          "Bisiklet",
                          "Motosiklet",
                          "Otomobil",
                          "Otobüs",
                          "Minibus",
                        ],
                      ),
                    ),
                    Expanded(
                      child: customPassangerCountsDropDown(
                          Icons.drive_eta_rounded, "Araç Sayısı", ""),
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
    IconData icon,
    String text,
    String? subText, {
    List<String>? items,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorsConstants.lightPrimary,
            ),
            Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: ColorsConstants.lightPrimary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                subText != null && subText.isNotEmpty
                    ? Text(
                        subText,
                        style: TextStyle(
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
            DropdownButton(
              underline: Container(
                height: 1,
                color: ColorsConstants.dividerColor,
              ),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: ColorsConstants.grey,
              ),
              items: (items != null && items.isNotEmpty
                      ? items
                      : List.generate(11, (index) => index))
                  .map(
                    (e) => DropdownMenuItem(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(e.toString()),
                      ),
                      value: e,
                    ),
                  )
                  .toList(),
              value: items != null && items.isNotEmpty ? items.first : 0,
              onChanged: (val) {},
            ),
          ],
        ),
      ],
    );
  }

  customCalendar({
    bool disabled = false,
  }) {
    return InkWell(
      onTap: () {
        if (disabled) {
          isOneWay.value = !isOneWay.value;
        } else {
          showDatePicker(
            locale: const Locale("tr", "TR"),
            context: Get.context!,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000, 1, 1),
            lastDate: DateTime(2024, 1, 1),
            cancelText: Strings.cancel,
            confirmText: Strings.select,
            currentDate: DateTime.now(),
            helpText: "Tarih Seçin",
            errorFormatText:
                "Tarih doğru formatta girilmedi. Tavsiye edilen tarih formatı \"01/01/2000\"",
            errorInvalidText: "Tarih geçerli değil.",
            fieldHintText: "01/01/2000",
            fieldLabelText: "",
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 20,
                    color:
                        disabled ? Colors.grey : ColorsConstants.lightPrimary,
                  ),
                  Text(
                    "Fr 6 Mar",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: disabled
                          ? Colors.grey
                          : Get.theme.textTheme.bodyText1!.color,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: disabled ? Colors.grey : Colors.black,
                  ),
                ],
              ),
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
