import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sauap_planner/src/config/router/router.dart';
import 'package:sauap_planner/src/config/theme/theme.dart';

class SauapPlannerApp extends StatelessWidget {
  const SauapPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('kk', 'KK')],
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: routes,
    );
  }
}
