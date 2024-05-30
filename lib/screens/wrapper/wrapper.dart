import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sauap_planner/components/bottom_tabs.dart';
import 'package:sauap_planner/routes/pages.dart';

import 'package:sauap_planner/utils/color_palette.dart';

// ignore: must_be_immutable
class Wrapper extends StatefulWidget {
  int selectedIndex = 0;

  Wrapper({super.key, required this.selectedIndex});

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

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      _selectedIndex = widget.selectedIndex;
    });
  }

  @override
  void initState() {
    _onItemTapped(widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      extendBody: false,
      body: IndexedStack(
        index: widget.selectedIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          gradient: kDefaultGradient,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: FloatingActionButton(
          splashColor: kPrimaryColor,
          backgroundColor: kTransparentColor,
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
        backgroundColor: kPrimaryColor,
        elevation: 0,
        itemCount: _iconList.length,
        activeIndex: _selectedIndex,
        borderColor: kGrey3,
        tabBuilder: (int index, bool isActive) {
          return Icon(
            _iconList[index],
            size: 30,
            color: isActive ? kWhiteColor : kGrey2,
          );
        },
        onTap: _onItemTapped,
        leftCornerRadius: 3,
        rightCornerRadius: 3,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
      ),
    );
  }
}
