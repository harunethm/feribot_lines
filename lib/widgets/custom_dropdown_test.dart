import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';

class CustomDropDownPassengerCount extends StatelessWidget {
  late RxString dropDownValue;
  late final IconData icon;
  Color iconColor = Colors.white;

  CustomDropDownPassengerCount({
    int? dropDownValue,
    IconData? icon,
    Color? iconColor,
    Key? key,
  }) : super(key: key) {
    this.dropDownValue =
        RxString(dropDownValue != null ? dropDownValue.toString() : "");
    this.icon = icon ?? Icons.person;
    if (iconColor != null) this.iconColor = iconColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 36.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Obx(
          () => DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isDense: true,
              dropdownColor: ColorsConstants.lightPrimary2,
              borderRadius: BorderRadius.circular(15),
              value: dropDownValue.value.toString(),
              // icon: dropDownIcon(icon, dropDownValue.value),
              icon: const SizedBox.shrink(),
              onChanged: (String? val) {
                dropDownValue(val ?? "");
              },
              items: List.generate(10, (index) => index)
                  .map<DropdownMenuItem<String>>(
                (int val) {
                  return DropdownMenuItem<String>(
                    value: val.toString(),
                    child: Text(
                      val.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  );
                },
              ).toList(),
              selectedItemBuilder: (context) {
                return List.generate(11, (index) => index).map(
                  (int val) {
                    return dropDownIcon(icon, val.toString());
                  },
                ).toList();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDownIcon(IconData icon, String count) {
    return Stack(
      children: <Widget>[
        Container(
          height: 36.0,
          width: 42.0,
          decoration: BoxDecoration(
            // color: ColorsConstants.lightPrimary.withAlpha(40),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Icon(
            icon,
            size: 24,
            color: iconColor,
          ),
        ),
        Positioned(
          left: 24.0,
          top: 4,
          child: Container(
            height: 18.0,
            width: 18.0,
            decoration: BoxDecoration(
              color: ColorsConstants.lightAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                count,
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
