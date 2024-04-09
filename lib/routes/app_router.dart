import 'package:flutter/material.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/screens/onboarding/onboarding.dart';
import 'package:sauap_planner/screens/splash/splash_screen.dart';
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
        builder: (context) => const Wrapper(),
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
