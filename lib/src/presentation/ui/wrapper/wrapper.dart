import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sauap_planner/src/presentation/widgets/bottom_tabs.dart';

// ignore: must_be_immutable
class Wrapper extends StatefulWidget {
  Wrapper({super.key, required this.selectedIndex});

  int selectedIndex = 0;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _onItemTapped(widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: widget.selectedIndex,
          children: [
            for (final tabItem in TabNavigationItem.items) tabItem.page,
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(
            bottom: 30,
          ),
          child: CustomNavigationBar(
            isFloating: true,
            borderRadius: const Radius.circular(15.0),
            iconSize: 30.0,
            backgroundColor: Colors.white,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.favorite_outline),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.notifications_outlined),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
              )
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
