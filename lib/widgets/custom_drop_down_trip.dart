import 'package:feribot_lines/utils/colors_const.dart';
import 'package:flutter/material.dart';

class CustomDropDownTrip extends StatelessWidget {
  List<String> items;
  late String selected = items.first;

  CustomDropDownTrip({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
          isDense: true,
          items: items
              .map(
                (e) => DropdownMenuItem<String>(
                  child: Text(
                    e,
                    style: TextStyle(color: ColorsConstants.lightWhite),
                  ),
                  value: e,
                ),
              )
              .toList(),
          selectedItemBuilder: (context) {
            return items
                .map(
                  (e) => DropdownMenuItem<String>(
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.black),
                    ),
                    value: e,
                  ),
                )
                .toList();
          },
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black,
          ),
          dropdownColor: ColorsConstants.lightPrimary2,
          value: selected,
          onChanged: (val) {
            selected = val!;
          }),
    );
  }
}
