import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../models/ferry/ferry_info_model.dart';
import '../utils/colors_const.dart';
import '../utils/strings.dart';
import '../viewModels/ferry/ferry_vm.dart';

class CustomFerryInfoCard extends StatelessWidget {
  const CustomFerryInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('tr');
    return ExpansionTileCard(
      baseColor: Get.theme.backgroundColor,
      expandedColor: Get.theme.backgroundColor,
      borderRadius: BorderRadius.circular(16),
      title: const Text(
        "Sefer Bilgileri",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Text("Bilgileri görmek için tıklayınız."),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: NetworkImageWithRetry(
                      FerryInfoModel
                              .sConsolidation.value.componyImagePath.isNotEmpty
                          ? FerryInfoModel.sConsolidation.value.componyImagePath
                          : Strings.emptyCompanyImagePath,
                    ),
                    width: 64,
                    height: 64,
                  ),
                  SizedBox(
                    width: Get.size.width * .02,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          FerryInfoModel.sConsolidation.value.companyName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          FerryInfoModel.sConsolidation.value.ferryName,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.size.width * .02,
                  ),
                  Image(
                    image: NetworkImageWithRetry(FerryInfoModel
                            .sConsolidation.value.ferryImagePath.isNotEmpty
                        ? FerryInfoModel.sConsolidation.value.ferryImagePath
                        : Strings.emptyFerryImagePath),
                    width: 64,
                    height: 64,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: tourInfo(
                  FerryInfoModel.sConsolidation.value.depertureDate,
                  FerryInfoModel.sConsolidation.value.deperturePort.value,
                  FerryInfoModel.sConsolidation.value.arriveDate,
                  FerryInfoModel.sConsolidation.value.arrivePort.value,
                  Strings.consolidation,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withAlpha(30),
                thickness: 2,
              ),
              Row(
                children: [
                  Image(
                    image: NetworkImageWithRetry(FerryInfoModel
                            .sReturnConsolidation
                            .value
                            .componyImagePath
                            .isNotEmpty
                        ? FerryInfoModel
                            .sReturnConsolidation.value.componyImagePath
                        : Strings.emptyCompanyImagePath),
                    width: 64,
                    height: 64,
                  ),
                  SizedBox(
                    width: Get.size.width * .02,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          FerryInfoModel.sConsolidation.value.companyName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          FerryInfoModel.sConsolidation.value.ferryName,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Get.size.width * .02,
                  ),
                  Image(
                    image: NetworkImageWithRetry(FerryInfoModel
                            .sReturnConsolidation
                            .value
                            .ferryImagePath
                            .isNotEmpty
                        ? FerryInfoModel
                            .sReturnConsolidation.value.ferryImagePath
                        : Strings.emptyFerryImagePath),
                    width: 64,
                    height: 64,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: tourInfo(
                  FerryInfoModel.sReturnConsolidation.value.depertureDate,
                  FerryInfoModel.sReturnConsolidation.value.deperturePort.value,
                  FerryInfoModel.sReturnConsolidation.value.arriveDate,
                  FerryInfoModel.sReturnConsolidation.value.arrivePort.value,
                  Strings.returnConsolidation,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withAlpha(30),
                thickness: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.adultsChildren,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      FerryVM()
                          .passengersAndCars(joinString: " &\n", type: 1)
                          .value,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey.withAlpha(30),
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: Get.context!,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              width: Get.size.width * .8,
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                              ),
                              decoration: BoxDecoration(
                                color: ColorsConstants.cartGrey,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        const Text(
                                          "Sefer Kuralları",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Icon(
                                            FontAwesomeIcons.windowClose,
                                            color: ColorsConstants.danger,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.size.height * .01,
                                    ),
                                    Text(Strings.tripRules),
                                    SizedBox(
                                      height: Get.size.height * .01,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("Kapat"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: ColorsConstants.lightPrimary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  Strings.tripRulesButton,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * .01,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget tourInfo(
  DateTime depertureTime,
  String departurePortName,
  DateTime arriveTime,
  String arrivePortName,
  String directionText,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${departurePortName}",
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${Strings.departure}: ",
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  "${depertureTime.hour.toString().padLeft(2, "0")}:${depertureTime.minute.toString().padLeft(2, "0")}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "${depertureTime.day.toString().padLeft(2, "0")}.${depertureTime.month.toString().padLeft(2, "0")}.${depertureTime.year}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              DateFormat(
                DateFormat.WEEKDAY,
                "tr_TR",
              ).format(
                depertureTime,
              ),
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(30),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              directionText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              arrivePortName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${Strings.arrive}: ",
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  "${arriveTime.hour.toString().padLeft(2, "0")}:${arriveTime.minute.toString().padLeft(2, "0")}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              // "24 Sep'21",
              "${arriveTime.day.toString().padLeft(2, "0")}.${arriveTime.month.toString().padLeft(2, "0")}.${arriveTime.year}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              DateFormat(
                DateFormat.WEEKDAY,
                "tr_TR",
              ).format(
                arriveTime,
              ),
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ],
  );
}
