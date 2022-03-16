import 'package:get/get.dart';

import 'package:feribot_lines/views/splash_screen.dart';
import 'package:feribot_lines/viewModels/ferry/ferrt_consolidations_vm.dart';
import 'package:feribot_lines/views/ferry/ferry_information.dart';
import 'package:feribot_lines/views/ferry/ferry_screen.dart';
import 'package:feribot_lines/views/ferry/ferry_consolidations.dart';
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

class CustomRoutes {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: "/",
      page: () {
        return SplashScreen();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/FerryScreen",
      page: () {
        return FerryScreen();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/FerryInformation",
      page: () {
        return FerryInformation();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/FerryConsolidations",
      page: () {
        return FerryConsolidations();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/Login",
      page: () {
        return Login();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/ForgotPassword",
      page: () {
        return ForgotPassword();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/Register",
      page: () {
        return Register();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/Payment",
      page: () {
        return Payment();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/PaymentSuccess",
      page: () {
        return PaymentSuccess();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/Profile",
      page: () {
        return Profile();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/AllTickets",
      page: () {
        return AllTickets();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/EditProfile",
      page: () {
        return EditProfile();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/NotificationsPage",
      page: () {
        return NotificationsPage();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: "/TicketDetails",
      page: () {
        return TicketDetails();
      },
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
