import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sauap_planner/src/utils/constants/colors.dart';

final appTheme = ThemeData(
  fontFamily: 'Inter',
  useMaterial3: true,
  scaffoldBackgroundColor: scaffoldColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w900,
    ),
    bodyMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(),
  drawerTheme: const DrawerThemeData(
    backgroundColor: blueColor,
  ),
);

TextStyle get homeTitle {
  return GoogleFonts.inter(
    fontSize: 24,
    color: Colors.black,
  );
}
