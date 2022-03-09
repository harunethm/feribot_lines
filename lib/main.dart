import 'package:feribot_lines/utils/colors_const.dart';
import 'package:feribot_lines/utils/const.dart';
import 'package:feribot_lines/views/_test_screen.dart';
import 'package:feribot_lines/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/splash_screen.dart';

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "FeribotLines",
      theme: Constants.lightTheme.copyWith(
        unselectedWidgetColor: ColorsConstants.lightPrimary,
      ),
      debugShowCheckedModeBanner: false,
      // getPages: [
      //   GetPage(
      //     name: "/",
      //     page: () {
      //       return SplashScreen();
      //     },
      //   ),
      //   GetPage(
      //     name: "/Test",
      //     page: () {
      //       return TestScreen();
      //     },
      //   ),
      // ],
      home: Login(),
    );
  }
}
