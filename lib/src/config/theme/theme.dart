import 'package:flutter/material.dart';
import 'package:sauap_planner/src/utils/constants/colors.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: scaffoldColor,
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
      )),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(),
);
