import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sauap_planner/src/presentation/ui/welcome/welcome.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2200,
      splash: 'assets/images/logo.png',
      splashIconSize: 240,
      backgroundColor: const Color.fromARGB(255, 98, 117, 157),
      nextScreen: const Welcome(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
