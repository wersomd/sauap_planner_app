import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/screens/page_not_found/page_not_found.dart';
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
    const PageNotFound(),
    const PageNotFound(),
    const PageNotFound(),
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
      floatingActionButton: FloatingActionButton(
        splashColor: kPrimaryColor,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        child: const Icon(
          CupertinoIcons.add,
          color: kWhiteColor,
          size: 40,
        ),
        onPressed: () {
          Navigator.pushNamed(context, Pages.createNewTask);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        borderColor: kGrey3,
        icons: _iconList,
        iconSize: 30,
        scaleFactor: .5,
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        onTap: _onItemTapped,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        activeColor: Colors.purple,
        inactiveColor: Colors.black,
      ),
    );
  }
}
