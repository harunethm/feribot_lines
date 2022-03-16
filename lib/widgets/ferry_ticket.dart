import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';
import '../utils/common_functions.dart';
import '../utils/strings.dart';
import 'custom_seperator.dart';

class FerryTicket extends StatelessWidget {
  final int ID = 0;

  final double price;

  final String arrivePort;
  final String deperturePort;

  final String companyName;
  final String companyLogoPath;
  final String ferryName;
  final RxBool isSelected;

  final String arrivalTime;
  final String arrivalDate;

  final String departureTime;
  final String departureDate;

  final VoidCallback onTap;

  final String totalTime;

  const FerryTicket({
    Key? key,
    required this.price,
    required this.arrivalTime,
    required this.arrivalDate,
    required this.departureDate,
    required this.departureTime,
    required this.arrivePort,
    required this.deperturePort,
    required this.totalTime,
    required this.companyName,
    required this.companyLogoPath,
    required this.ferryName,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = CommonFunctions.isLightTheme();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: <Widget>[
          Card(
            color: Get.theme.backgroundColor,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 35.0, right: 35.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '$price TL',
                        style: const TextStyle(
                          color: ColorsConstants.lightAccent,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        departureDate,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        arrivalDate,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        deperturePort,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        arrivePort,
                        style: const TextStyle(
                          fontSize: 25.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        departureTime,
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        arrivalTime,
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            totalTime,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      const FaIcon(
                        FontAwesomeIcons.anchor,
                        size: 20,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: CustomSeperator(
                            color: isLightTheme ? Colors.black : Colors.white),
                      ),
                      companyLogoPath.isNotEmpty
                          ? Image.asset(
                              companyLogoPath,
                              width: 48,
                              height: 48,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              "assets/images/fethiye-rodos-ferry-tilos.jpg",
                              width: 48,
                              height: 48,
                              fit: BoxFit.fill,
                            ),
                      Expanded(
                        child: CustomSeperator(
                            color: isLightTheme ? Colors.black : Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      const FaIcon(
                        FontAwesomeIcons.anchor,
                        size: 20,
                        color: Colors.grey,
                      ),
                      Expanded(
                        child: CustomSeperator(
                            color: isLightTheme ? Colors.black : Colors.white),
                      ),
                      companyLogoPath.isNotEmpty
                          ? Image.asset(
                              companyLogoPath,
                              width: 48,
                              height: 48,
                              fit: BoxFit.fill,
                            )
                          : Image.asset(
                              "assets/images/fethiye-rodos-ferry-tilos.jpg",
                              width: 48,
                              height: 48,
                              fit: BoxFit.fill,
                            ),
                      Expanded(
                        child: CustomSeperator(
                            color: isLightTheme ? Colors.black : Colors.white),
                      ),
                      const FaIcon(
                        FontAwesomeIcons.anchor,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    ferryName,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        totalTime,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(right: 4, top: 4),
              decoration: const BoxDecoration(
                color: ColorsConstants.lightAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 36.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 4.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      companyName,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Obx(
                () => Container(
                  margin: const EdgeInsets.only(right: 3, top: 3),
                  decoration: BoxDecoration(
                    color: isSelected.value
                        ? ColorsConstants.lightPrimary
                        : Colors.grey,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  height: 32.0,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          isSelected.value ? Strings.selected : Strings.select,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}