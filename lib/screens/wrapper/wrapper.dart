import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/screens/billing/billing.dart';
import 'package:sauap_planner/screens/calendar/calendar.dart';
import 'package:sauap_planner/screens/profile/profile.dart';
import 'package:sauap_planner/tasks/presentation/pages/tasks_screen.dart';
import 'package:sauap_planner/utils/color_palette.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _selectedIndex = 0;

  final _iconList = <IconData>[
    Icons.home_outlined,
    Icons.calendar_month_outlined,
    Icons.money_outlined,
    Icons.person_2_outlined,
  ];

  final _pages = [
    const TasksScreen(),
    const CalendarPage(),
    const BillingPage(),
    const ProfilePage(),
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
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          gradient: kDefaultGradient,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: FloatingActionButton(
          splashColor: kPrimaryColor,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(
            Icons.add,
            color: kWhiteColor,
            size: 40,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Pages.createNewTask);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        borderColor: kGrey3,
        scaleFactor: .5,
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        onTap: _onItemTapped,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        itemCount: _pages.length,
        tabBuilder: (int index, bool isActive) {
          return Icon(
            _iconList[index],
            size: 30,
            color: isActive ? kPrimaryColor : kBlackColor,
          );
        },
        leftCornerRadius: 32,
        rightCornerRadius: 32,
      ),
    );
  }
}
