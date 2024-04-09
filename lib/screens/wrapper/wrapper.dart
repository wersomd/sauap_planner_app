import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sauap_planner/screens/auth/login/login.dart';
import 'package:sauap_planner/tasks/presentation/pages/tasks_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _selectedIndex = 0;

  final _pages = [
    const TasksScreen(),
    const SignInPage(),
    const SignInPage(),
    const SignInPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _onItemTapped(_selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        borderRadius: const Radius.circular(15.0),
        iconSize: 36.0,
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.calendar_month_outlined),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.analytics_outlined),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
