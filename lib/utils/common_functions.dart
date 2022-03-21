import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:feribot_lines/utils/page_transation/enum.dart';
import 'package:feribot_lines/utils/page_transation/page_transition.dart';

import '../views/Login/login.dart';
import '../views/profile/profile.dart';
import 'theme_constants.dart';

class CommonFunctions {
  static String apiKey = "AIzaSyDr4aP_rczqVSLo86cMdinyPs-tIFlh9AE";

  // static TextStyle titleStyle =
  //     const TextStyle(letterSpacing: 1.2, fontSize: 20);
  // static TextStyle themeSubTitleStyle = const TextStyle(
  //   fontSize: 12,
  //   letterSpacing: 1.1,
  //   height: 1.2,
  //   fontWeight: FontWeight.w200,
  // );
  // TextStyle commonStyle() {
  //   return GoogleFonts.pacifico();
  // }

  static void openProfile() {
    if (CommonFunctions.isUserLogined()) {
      Get.to(
        () => Profile(),
        duration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      );
    } else {
      Get.offAll(
        () => Login(),
        duration: Duration(milliseconds: 300),
        transition: Transition.rightToLeft,
      );
    }
  }

  static PageTransition pushWithRightAnimation(
      {required Widget child, required Duration duration}) {
    return PageTransition(
        child: child, type: PageTransitionType.rightToLeft, duration: duration);
  }

  static PageTransition pushWithTopAnimation(
      {required Widget child, required Duration duration}) {
    return PageTransition(
        child: child, type: PageTransitionType.bottomToTop, duration: duration);
  }

  static PageTransition pushWithFadeAnimation(
      {required Widget child, required Duration duration}) {
    return PageTransition(
        child: child, type: PageTransitionType.fade, duration: duration);
  }

  static bool isLightTheme() {
    bool isLightTheme = Get.theme == ThemeConstants.lightTheme;
    return isLightTheme;
  }

  // static int getRealIndex(int position, int base, int? length) {
  //   final int offset = position - base;
  //   return remainder(offset, length);
  // }

  // static int remainder(int input, int? source) {
  //   if (source == 0) return 0;
  //   final int result = input % source!;
  //   return result < 0 ? source + result : result;
  // }

  // static Widget switchThemeWidget() {
  //   return Switch(
  //     inactiveTrackColor: Colors.grey,
  //     inactiveThumbColor: Get.theme.primaryColor,
  //     value: Get.theme == Constants.lightTheme ? false : true,
  //     onChanged: (v) async {
  //       if (v) {
  //         // Provider.of<AppProvider>(context, listen: false)
  //         //     .setTheme(Constants.darkTheme, "dark");
  //         Get.changeTheme(Constants.darkTheme);
  //       } else {
  //         // Provider.of<AppProvider>(context, listen: false)
  //         //     .setTheme(Constants.lightTheme, "light");
  //         Get.changeTheme(Constants.lightTheme);
  //       }
  //     },
  //     activeColor: Get.theme.colorScheme.secondary,
  //   );
  // }

  static bool login = true;
  static bool isUserLogined() {
    return login;
  }
}

const headerStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
const titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
const subtitleStyle = TextStyle(color: Colors.grey, fontSize: 12);
//const monthStyle = TextStyle(color: ColorsConstants.appColor, fontSize: 16, fontWeight: FontWeight.w500);

// const String devMausam =
//     'https://firebasestorage.googleapis.com/v0/b/dl-flutter-ui-challenges.appspot.com/o/mausam%2Fprofile.jpg?alt=media&token=83fa8b83-f53b-489c-a799-ca5d5aceae7b';

const Color furnitureCateDisableColor = Color(0xFF939BA9);
