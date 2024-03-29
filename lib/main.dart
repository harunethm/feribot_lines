import 'package:feribot_lines/utils/colors_const.dart';
import 'package:feribot_lines/utils/theme_constants.dart';
import 'package:feribot_lines/utils/routes.dart';
import 'package:feribot_lines/views/login/login.dart';

import 'package:feribot_lines/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('tr'),
      ],
      title: "FeribotLines",
      theme: ThemeConstants.lightTheme.copyWith(
        unselectedWidgetColor: ColorsConstants.lightPrimary,
      ),
      getPages: CustomRoutes.routes,
      home: SplashScreen(),
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    );
  }
}
