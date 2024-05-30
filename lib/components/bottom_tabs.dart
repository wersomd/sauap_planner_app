import 'package:flutter/material.dart';
import 'package:sauap_planner/screens/billing/billing.dart';
import 'package:sauap_planner/screens/calendar/calendar.dart';
import 'package:sauap_planner/screens/profile/profile.dart';
import 'package:sauap_planner/tasks/presentation/pages/tasks_screen.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem(
      {required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const TasksScreen(),
          icon: const Icon(Icons.home_outlined),
          title: const Text("Главная"),
        ),
        TabNavigationItem(
          page: const CalendarPage(),
          icon: const Icon(Icons.calendar_month_outlined),
          title: const Text("Күнтізбе"),
        ),
        TabNavigationItem(
          page: const BillingPage(),
          icon: const Icon(Icons.money_outlined),
          title: const Text("Фонд"),
        ),
        TabNavigationItem(
          page: const ProfilePage(),
          icon: const Icon(Icons.person_2_outlined),
          title: const Text("Профиль"),
        ),
      ];
}
