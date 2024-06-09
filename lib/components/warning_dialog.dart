import 'package:flutter/material.dart';
import 'package:sauap_planner/utils/color_palette.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/util.dart';

class WarningDialog extends StatelessWidget {
  final String charity;
  const WarningDialog({super.key, required this.charity});
  @override
  Widget build(BuildContext context) {
    Future<void> launchURL(String url) async {
      final uri = Uri.parse(url);
      if (await launchUrl(uri)) {
        await canLaunchUrl(uri);
      } else {
        getSnackBar('Ошибка', kRed);
      }
    }

    return AlertDialog(
      elevation: 0,
      alignment: Alignment.center,
      title: const Text('Ескерту'),
      contentPadding: const EdgeInsets.all(30.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Құрметті пайдаланушы!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Тапсырма уақыты бітуде, сіз еңгізген сумма $charity қаражатына аударылады.",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(0),
            foregroundColor: WidgetStateProperty.all<Color>(kWhiteColor),
            backgroundColor: WidgetStateProperty.all<Color>(kPrimaryColor),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: () {
            launchURL("https://kaspi.kz/");
          },
          child: const Text(
            "Қорға жіберу",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
