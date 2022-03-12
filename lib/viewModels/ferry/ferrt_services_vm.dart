import 'package:feribot_lines/viewModels/tab_controller_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FerryServicesVM extends GetxController {

  init() {
    CustomTabController tabController = Get.put(CustomTabController(active: 0));
  }
}
