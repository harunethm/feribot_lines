import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:feribot_lines/models/ferry/ferry_info_model.dart';
import 'package:feribot_lines/models/ferry/search_model.dart';
import 'package:feribot_lines/viewModels/ferry/ferry_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';
import '../utils/strings.dart';

class CustomPriceInfoCard extends StatelessWidget {
  const CustomPriceInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: Get.theme.backgroundColor,
      expandedColor: Get.theme.backgroundColor,
      borderRadius: BorderRadius.circular(16),
      title: const Text(
        "Fiyat Bilgileri",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("Bilgileri görmek için tıklayınız."),
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // priceRow(
              //   text: FerryVM().passengersAndCars(joinString: ", ").value,
              //   subText: Strings.totalPrice,
              //   price:
              //       "${FerryInfoModel.sConsolidation.value.totalAmount ?? "0"} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}",
              // ),
              SearchModel.adultCount > 0
                  ? priceRow(
                      text: "${SearchModel.adultCount.value} Yetişkin",
                      subText:
                          "Birim Fiyatı: ${FerryInfoModel.sConsolidation.value.adult ?? "0"} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}",
                      price:
                          "${SearchModel.adultCount * int.parse(FerryInfoModel.sConsolidation.value.adult ?? '0')} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}")
                  : const SizedBox.shrink(),
              SearchModel.childCount > 0
                  ? priceRow(
                      text: "${SearchModel.childCount.value} Çocuk",
                      subText:
                          "Birim Fiyatı: ${FerryInfoModel.sConsolidation.value.children ?? "0"} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}",
                      price:
                          "${SearchModel.childCount * int.parse(FerryInfoModel.sConsolidation.value.children ?? '0')} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}")
                  : const SizedBox.shrink(),
              SearchModel.babyCount > 0
                  ? priceRow(
                      text: "${SearchModel.babyCount.value} Bebek",
                      subText:
                          "Birim Fiyatı: ${FerryInfoModel.sConsolidation.value.baby ?? "0"} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}",
                      price:
                          "${SearchModel.babyCount * int.parse(FerryInfoModel.sConsolidation.value.adult ?? '0')} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}")
                  : const SizedBox.shrink(),
              SearchModel.carCount > 0
                  ? priceRow(
                      text:
                          "${SearchModel.carCount.value} ${FerryVM().carType()}",
                      subText: "Birim Fiyatı: ${_calculatePrice()}"
                          " ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}",
                      price:
                          "${SearchModel.carCount * int.parse(_calculatePrice())} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}")
                  : const SizedBox.shrink(),
              priceRow(
                text: "Toplam Tutar",
                subText: "Genel Toplam",
                price:
                    "${FerryInfoModel.sConsolidation.value.totalAmount ?? "0"} ${FerryInfoModel.sConsolidation.value.exchangeCode ?? ""}",
                textColor: ColorsConstants.lightPrimary,
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _calculatePrice() {
    switch (FerryVM().carType()) {
      case "Bisiklet":
        return FerryInfoModel.sConsolidation.value.bike ?? "0";
      case "Motorsiklet":
        return FerryInfoModel.sConsolidation.value.motorcycle ?? "0";
      case "Otomobil":
        return FerryInfoModel.sConsolidation.value.automobile ?? "0";
      case "Otobüs":
        return FerryInfoModel.sConsolidation.value.bus ?? "0";
      case "Minibüs":
        return FerryInfoModel.sConsolidation.value.minibus ?? "0";
      default:
        return "0";
    }
  }

  Widget priceRow(
      {String text = "",
      String subText = "",
      String price = "",
      bool isLast = false,
      Color textColor = Colors.black}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 15,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: subText.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                subText,
                style: TextStyle(
                  color: textColor.withAlpha(155),
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Visibility(
          visible: !isLast,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              color: Colors.grey.withAlpha(30),
              thickness: 2,
            ),
          ),
        ),
        Visibility(
          visible: !isLast,
          child: const SizedBox(
            height: 5,
          ),
        )
      ],
    );
  }
}
