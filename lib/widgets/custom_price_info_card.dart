import 'package:expansion_tile_card/expansion_tile_card.dart';
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // Strings.roomNight,
                      "1 Yetişkin, 2 Çocuk, Arabasız",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.w800),
                    ),
                    const Text(
                      "₺ 200",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.basePrice,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Divider(
                  color: Colors.grey.withAlpha(30),
                  thickness: 2,
                ),
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
                      Strings.tDiscount,
                      style: TextStyle(
                        color: ColorsConstants.lightPrimary,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "₺ 50",
                      style: TextStyle(
                        color: ColorsConstants.lightPrimary,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey.withAlpha(30),
                height: 2,
              ),
              Container(
                color: Colors.blue.withAlpha(10),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.priceDiscount,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      const Text(
                        "₺ 150",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.grey.withAlpha(30),
                height: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.serviceFee,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "₺ 10",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Divider(
                  color: Colors.grey.withAlpha(30),
                  thickness: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.amountPaid,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      "₺ 160",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
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
