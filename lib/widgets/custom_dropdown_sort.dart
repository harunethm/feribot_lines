import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';

class CustomDropDown extends StatelessWidget {
  RxString dropDownValue = "".obs;

  final Color bgColor;
  final Color dropdownColor;
  final double borderRadius;
  final FaIcon? icon;
  final List<String> items;
  final List<String> values;
  CustomDropDown({
    Key? key,
    String? dropDownValue,
    this.bgColor = Colors.white12,
    this.dropdownColor = ColorsConstants.lightPrimary2,
    this.borderRadius = 15,
    this.items = const ["Seçiniz."],
    this.values = const ["Seçiniz."],
    this.icon,
  }) : super(key: key) {
    this.dropDownValue = dropDownValue != null
        ? RxString(dropDownValue)
        : RxString(values.first);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: 30.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Obx(
          () => DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: ColorsConstants.lightPrimary2,
              borderRadius: BorderRadius.circular(15),
              value: dropDownValue.value,
              icon: icon ??
                  FaIcon(
                    FontAwesomeIcons.angleDown,
                    size: 16.0,
                    color: Colors.white,
                  ),
              onChanged: (String? val) {
                dropDownValue(val ?? items.first);
              },
              isDense: true,
              items: items.map<DropdownMenuItem<String>>(
                (String val) {
                  return DropdownMenuItem<String>(
                    value: values[items.indexOf(val)],
                    child: Text(
                      val,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
