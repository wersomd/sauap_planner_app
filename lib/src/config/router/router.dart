import 'package:sauap_planner/src/presentation/ui/auth/sign_in.dart';
import 'package:sauap_planner/src/presentation/ui/auth/sign_up.dart';
import 'package:sauap_planner/src/presentation/ui/home/details.dart';
import 'package:sauap_planner/src/presentation/ui/home/home.dart';
import 'package:sauap_planner/src/presentation/ui/splash/splash.dart';
import 'package:sauap_planner/src/presentation/ui/welcome/welcome.dart';
import 'package:sauap_planner/src/presentation/ui/wrapper/wrapper.dart';

final routes = {
  '/': (context) => const AppSplashScreen(),
  '/wrapper': (context) => const Wrapper(),
  '/welcome': (context) => const Welcome(),
  '/home': (context) => const Home(),
  '/signup': (context) => const SignUpPage(),
  '/signin': (context) => const SignInPage(),
  '/details': (context) => const Details(),
};
