import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sauap_planner/utils/font_sizes.dart';

DateTime toDate({required String dateTime}) {
  final utcDateTime = DateTime.parse(dateTime);
  return utcDateTime.toLocal();
}

String formatDate({required String dateTime, format = "dd MMM, yyyy"}) {
  final localDateTime = toDate(dateTime: dateTime);
  return DateFormat(format, 'KK_kk').format(localDateTime);
}

SnackBar getSnackBar(String message, Color backgroundColor) {
  SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: textMedium),
    ),
    backgroundColor: backgroundColor,
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
  );
  return snackBar;
}

class ApiUtil {
  static String apiKey = 'YOUR_API_KEY';
  static String baseUrl = 'https://api.openai.com/v1/chat/completions';
}
