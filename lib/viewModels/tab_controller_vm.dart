import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTabController extends GetxController {
  RxInt activeTab = 0.obs;
  List<String> tabs = <String>[];
  final PageController pageController = PageController(initialPage: 0);

  CustomTabController({int active = 0}) {
    activeTab = RxInt(active);
  }

  void nextPage() {
    if (activeTab < tabs.length - 2) {
      activeTab.value++;
      activeTab.refresh();
    }
  }

  void previousPage() {
    if (activeTab > 0) {
      activeTab.value--;
      activeTab.refresh();
    }
  }

  void togglePage() {
    activeTab.value = (activeTab.value + 1) % 2;
    activeTab.refresh();
  }
}
