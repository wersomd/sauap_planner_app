import 'package:flutter/material.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/screens/ai/sauap_ai.dart';
import 'package:sauap_planner/screens/auth/login/login.dart';
import 'package:sauap_planner/screens/auth/registration/signup.dart';
import 'package:sauap_planner/screens/billing/billing.dart';
import 'package:sauap_planner/screens/calendar/calendar.dart';
import 'package:sauap_planner/screens/onboarding/onboarding.dart';
import 'package:sauap_planner/screens/profile/profile.dart';
import 'package:sauap_planner/screens/splash/splash.dart';
import 'package:sauap_planner/screens/wrapper/wrapper.dart';
import 'package:sauap_planner/tasks/data/local/model/task_model.dart';
import 'package:sauap_planner/tasks/presentation/pages/new_task_screen.dart';
import 'package:sauap_planner/tasks/presentation/pages/tasks_screen.dart';
import 'package:sauap_planner/tasks/presentation/pages/update_task_screen.dart';

import '../screens/page_not_found/page_not_found.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Pages.initial:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Pages.wrapper:
      return MaterialPageRoute(
        builder: (context) => Wrapper(
          selectedIndex: 0,
        ),
      );
    case Pages.home:
      return MaterialPageRoute(
        builder: (context) => const TasksScreen(),
      );
    case Pages.onboarding:
      return MaterialPageRoute(
        builder: (context) => const Onboarding(),
      );
    case Pages.createNewTask:
      return MaterialPageRoute(
        builder: (context) => const NewTaskScreen(),
      );
    case Pages.login:
      return MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );
    case Pages.signup:
      return MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      );
    case Pages.billing:
      return MaterialPageRoute(
        builder: (context) => const BillingPage(),
      );
    case Pages.calendar:
      return MaterialPageRoute(
        builder: (context) => const CalendarPage(),
      );
    case Pages.profile:
      return MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      );
    case Pages.sauapAi:
      return MaterialPageRoute(
        builder: (context) => const SauapAi(),
      );
    case Pages.updateTask:
      final args = routeSettings.arguments as TaskModel;
      return MaterialPageRoute(
        builder: (context) => UpdateTaskScreen(taskModel: args),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const PageNotFound(),
      );
  }
}
