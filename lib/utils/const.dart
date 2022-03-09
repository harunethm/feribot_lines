import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_const.dart';

class Constants {
  static String appName = "Themes UI Kit";

  static TextStyle themeTitleStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Inter",
    backgroundColor: ColorsConstants.lightBG,
    primaryColor: ColorsConstants.lightPrimary,
    colorScheme: ColorScheme.light(
      primary: ColorsConstants.lightPrimary,
      secondary: ColorsConstants.lightAccent,
      brightness: Brightness.light,
    ),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: ColorsConstants.lightAccent),
    scaffoldBackgroundColor: ColorsConstants.lightBG,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsConstants.darkBG),
      backgroundColor: ColorsConstants.lightPrimary,
      titleTextStyle: TextStyle(
        // subtitle1: GoogleFonts.inter(
        color: ColorsConstants.darkBG,
        fontSize: 18.0,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        // ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "Inter",
    brightness: Brightness.dark,
    backgroundColor: ColorsConstants.darkBG,
    primaryColor: ColorsConstants.darkPrimary,
    colorScheme: ColorScheme.light(
      primary: ColorsConstants.darkPrimary,
      secondary: ColorsConstants.darkAccent,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: ColorsConstants.darkBG,
    textTheme: TextTheme(
      subtitle1: GoogleFonts.inter(
        color: ColorsConstants.lightBG,
      ),
    ),
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: ColorsConstants.darkAccent),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsConstants.lightPrimary),
      backgroundColor: ColorsConstants.darkPrimary,
      titleTextStyle: TextStyle(
        // subtitle1: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
        letterSpacing: -1.5,
        fontFamily: 'Inter',
        color: ColorsConstants.lightBG,
        // ),
      ),
    ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
  );
}
