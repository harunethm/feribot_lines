import 'package:feribot_lines/models/key_value_model.dart';
import 'package:feribot_lines/widgets/custom_drop_down_trip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.size.width,
        height: Get.size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width * .5,
                      child: CustomDropDownTrip(
                        items: [
                          KeyValue(0, "name0"),
                          KeyValue(1, "name1"),
                          KeyValue(2, "name2")
                        ],
                        selected: 0,
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
