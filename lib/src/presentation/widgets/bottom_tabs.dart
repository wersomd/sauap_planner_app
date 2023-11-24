import 'package:flutter/material.dart';
import 'package:sauap_planner/src/presentation/ui/home/community.dart';
import 'package:sauap_planner/src/presentation/ui/home/home.dart';
import 'package:sauap_planner/src/presentation/ui/home/plans.dart';

class TabNavigationItem {
  final Widget page;
  final Icon icon;

  TabNavigationItem({required this.page, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const Home(),
          icon: const Icon(Icons.home_outlined),
        ),
        TabNavigationItem(
          page: const Plans(),
          icon: const Icon(Icons.favorite_border),
        ),
        TabNavigationItem(
          page: const Community(),
          icon: const Icon(Icons.notifications_outlined),
        ),
        TabNavigationItem(
          page: const Plans(),
          icon: const Icon(Icons.person_outline),
        ),
      ];
}
