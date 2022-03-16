import 'package:feribot_lines/models/key_value_model.dart';
import 'package:feribot_lines/utils/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDropDownTrip extends StatelessWidget {
  List<KeyValue> items;
  int selected;
  void Function(int?)? onChanged;

  CustomDropDownTrip({
    required this.items,
    required this.selected,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        isDense: true,
        items: items.isNotEmpty
            ? items
                .map(
                  (e) => DropdownMenuItem<int>(
                    child: Text(
                      e.value,
                      style: const TextStyle(color: ColorsConstants.lightWhite),
                    ),
                    value: e.key,
                  ),
                )
                .toList()
            : [
                const DropdownMenuItem<int>(
                  child: Text(
                    "Seçiniz",
                    style: TextStyle(color: ColorsConstants.lightWhite),
                  ),
                  value: 0,
                ),
              ],
        selectedItemBuilder: (context) {
          return items.isNotEmpty
              ? items
                  .map(
                    (e) => DropdownMenuItem<int>(
                      child: Text(
                        e.value,
                        style: const TextStyle(color: Colors.black),
                      ),
                      value: e.key,
                    ),
                  )
                  .toList()
              : [
                  const DropdownMenuItem<int>(
                    child: Text(
                      "Seçiniz",
                      style: TextStyle(color: Colors.black),
                    ),
                    value: 0,
                  ),
                ];
        },
        icon: const FaIcon(
          FontAwesomeIcons.chevronDown,
          size: 12,
          color: Colors.black,
        ),
        dropdownColor: ColorsConstants.lightPrimary2,
        value: items.isNotEmpty
            ? items.singleWhere((element) => element.key == selected).key
            : 0,
        onChanged: onChanged,
      ),
    );
  }
}
