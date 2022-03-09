import 'package:feribot_lines/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors_const.dart';

class TabController extends GetxController {
  RxInt activeTab = 0.obs;

  TabController({int active = 0}) {
    activeTab = RxInt(active);
  }
}

class CustomTabs extends StatelessWidget {
  late final List<String> tabs;
  late final TabController controller;

  late final Color _selectedTextColor;
  late final Color _unSelectedTextColor;
  late final Color _selectedBGColor;
  late final Color _borderColor;
  late final int _padding;

  late final Function? onChange;

  CustomTabs({
    Key? key,
    required this.tabs,
    this.onChange,
    int activeTab = 0,
    Color? selectedTextColor,
    Color? unSelectedTextColor,
    Color? selectedBGColor,
    Color? borderColor,
    int? padding,
  }) : super(key: key) {
    controller = Get.put(TabController(active: activeTab));
    bool isLigtTheme = CommonFunctions.isLightTheme();
    _padding = padding ?? 40;
    if (isLigtTheme) {
      _borderColor = borderColor ?? Colors.white;

      _selectedBGColor = selectedBGColor ?? ColorsConstants.lightAccent;

      _selectedTextColor = selectedTextColor ?? Colors.white;
      _unSelectedTextColor = unSelectedTextColor ?? Colors.white;
    } else {
      _borderColor = borderColor ?? Colors.white;

      _selectedBGColor = selectedBGColor ?? ColorsConstants.lightAccent;

      _selectedTextColor = selectedTextColor ?? Colors.white;
      _unSelectedTextColor = unSelectedTextColor ?? Colors.white;
    }
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
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 0; i < tabs.length; i++)
                  categoryWidget(
                    isSelected: controller.activeTab.value == i,
                    category: Category(
                      categoryId: i,
                      name: tabs[i],
                    ),
                    width:
                        (Get.size.width - _padding - 2 /* -2 for borders */) /
                            tabs.length,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryWidget({isSelected, category, width}) {
    return InkWell(
      onTap: () {
        if (!isSelected) {
          controller.activeTab(category.categoryId);
        }
        onChange != null ? onChange!() : null;
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: width > 100 ? width : 100,
        ),
        decoration: BoxDecoration(
          color: isSelected ? _selectedBGColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(
              color: isSelected ? _selectedTextColor : _unSelectedTextColor,
            ),
          ),
        ),
      ),
    );
  }
}

// class CategoryWidget extends StatelessWidget {
//   final Category category;
//   final bool isSelected;
//   TabController controller = Get.find();
//   CategoryWidget({Key? key, required this.category, required this.isSelected})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double width = (Get.size.width - 44) / controller.tabCount.value;
//     return InkWell(
//       onTap: () {
//         if (!isSelected) {
//           controller.selectedCategory(category.categoryId);
//         }
//       },
//       child: Container(
//         constraints: BoxConstraints(
//           minWidth: width > 100 ? width : 100,
//         ),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.white : Colors.transparent,
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//         child: Center(
//           child: Text(
//             category.name,
//             style: isSelected
//                 ? TextStyle(color: ColorsConstants.appColor)
//                 : const TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

class Category {
  final int categoryId;
  final String name;
  Category({required this.categoryId, required this.name});
}

final oneWay = Category(
  categoryId: 0,
  name: 'On Way',
);

final twoWay = Category(
  categoryId: 1,
  name: 'Two Way',
);

final categories = [
  oneWay,
  twoWay,
];
