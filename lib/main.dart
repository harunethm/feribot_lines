import 'package:feribot_lines/utils/colors_const.dart';
import 'package:feribot_lines/utils/const.dart';
import 'package:feribot_lines/views/ferry/ferry_information.dart';
import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:feribot_lines/views/ferry/ferry_services.dart';
import 'package:feribot_lines/views/login/forgot_password.dart';
import 'package:feribot_lines/views/login/login.dart';
import 'package:feribot_lines/views/login/register.dart';
import 'package:feribot_lines/views/payment/payment.dart';
import 'package:feribot_lines/views/payment/payment_success.dart';
import 'package:feribot_lines/views/profile/all_tickets.dart';
import 'package:feribot_lines/views/profile/edit_profile.dart';
import 'package:feribot_lines/views/profile/notifications.dart';
import 'package:feribot_lines/views/profile/profile.dart';
import 'package:feribot_lines/views/profile/ticket_details.dart';
import 'package:feribot_lines/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:localization/localization.dart';

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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('tr'),
        const Locale('en'),
      ],
      title: "FeribotLines",
      theme: Constants.lightTheme.copyWith(
        unselectedWidgetColor: ColorsConstants.lightPrimary,
      ),
      getPages: [
        GetPage(
          name: "/",
          page: () {
            return SplashScreen();
          },
        ),
        GetPage(
          name: "/FerryScreen",
          page: () {
            return FerryScreen();
          },
        ),
        GetPage(
          name: "/FerryInformation",
          page: () {
            return FerryInformation();
          },
        ),
        GetPage(
          name: "/FerryServices",
          page: () {
            return FerryServices();
          },
        ),
        GetPage(
          name: "/Login",
          page: () {
            return Login();
          },
        ),
        GetPage(
          name: "/ForgotPassword",
          page: () {
            return ForgotPassword();
          },
        ),
        GetPage(
          name: "/Register",
          page: () {
            return Register();
          },
        ),
        GetPage(
          name: "/Payment",
          page: () {
            return Payment();
          },
        ),
        GetPage(
          name: "/PaymentSuccess",
          page: () {
            return PaymentSuccess();
          },
        ),
        GetPage(
          name: "/Profile",
          page: () {
            return Profile();
          },
        ),
        GetPage(
          name: "/AllTickets",
          page: () {
            return AllTickets();
          },
        ),
        GetPage(
          name: "/EditProfile",
          page: () {
            return EditProfile();
          },
        ),
        GetPage(
          name: "/NotificationsPage",
          page: () {
            return NotificationsPage();
          },
        ),
        GetPage(
          name: "/TicketDetails",
          page: () {
            return TicketDetails();
          },
        ),
      ],
      home: SplashScreen(),
    );
  }
}
