import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';
import '../viewModels/tab_controller_vm.dart';

class CustomTabs extends StatelessWidget {
  late final Color _selectedTextColor;
  late final Color _unSelectedTextColor;
  late final Color _selectedBGColor;
  late final Color _borderColor;
  late final int _padding;

  late final Function? onChange;
  late CustomTabController tabController;

  CustomTabs({
    Key? key,
    this.onChange,
    int activeTab = 0,
    Color? selectedTextColor,
    Color? unSelectedTextColor,
    Color? selectedBGColor,
    Color? borderColor,
    int? padding,
    String? controllerTag,
    required this.tabController,
  }) : super(key: key) {
    _padding = padding ?? 40;

    _borderColor = borderColor ?? Colors.white;

    _selectedBGColor = selectedBGColor ?? ColorsConstants.lightAccent;

    _selectedTextColor = selectedTextColor ?? Colors.white;
    _unSelectedTextColor = unSelectedTextColor ?? Colors.white;
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 45.0,
        width: Get.size.width - _padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(
            color: _borderColor,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < tabController.tabs.length; i++)
                Obx(
                  () => customTabWidget(
                    index: i,
                    width:
                        (Get.size.width - _padding - 2 /* -2 for borders */) /
                            tabController.tabs.length,
                    onTap: () {
                      tabController.activeTab(i);

                      tabController.pageController.animateToPage(
                        tabController.activeTab.value,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      
                      onChange != null ? onChange!() : null;
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTabWidget({index, width, onTap}) {
    bool _isSelected = index == tabController.activeTab.value ? true : false;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: width > 100 ? width : 100,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? _selectedBGColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Center(
          child: Text(
            tabController.tabs[index],
            style: TextStyle(
              color: _isSelected ? _selectedTextColor : _unSelectedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
