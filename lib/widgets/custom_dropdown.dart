import 'package:feribot_lines/models/others/key_value_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';

class CustomDropDown extends StatelessWidget {
  final Color bgColor;
  final Color dropdownColor;
  final double borderRadius;
  final FaIcon? icon;
  final List<KeyValue> items;
  final int value;
  final void Function(int?)? onChange;

  CustomDropDown({
    Key? key,
    this.bgColor = Colors.white12,
    this.dropdownColor = ColorsConstants.lightPrimary2,
    this.borderRadius = 16,
    this.icon,
    required this.items,
    required this.onChange,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: 32.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            menuMaxHeight: Get.size.height * .5,
            dropdownColor: ColorsConstants.lightPrimary2,
            borderRadius: BorderRadius.circular(15),
            icon: icon ??
                const FaIcon(
                  FontAwesomeIcons.angleDown,
                  size: 16.0,
                  color: Colors.white,
                ),
            isDense: true,
            items: items.map(
              (KeyValue element) {
                return DropdownMenuItem<int>(
                  child: Text(
                    element.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                  value: element.key,
                );
              },
            ).toList(),
            value: value,
            onChanged: onChange,
          ),
        ),
      ),
    );
  }
}
