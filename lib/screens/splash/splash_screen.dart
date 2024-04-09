import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sauap_planner/screens/onboarding/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2200,
      splash: 'assets/images/app_logo.png',
      splashIconSize: 240,
      backgroundColor: const Color.fromARGB(255, 98, 117, 157),
      nextScreen: const Onboarding(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
    );
  }
}
