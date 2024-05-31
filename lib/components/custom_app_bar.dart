import 'package:flutter/material.dart';
import 'package:sauap_planner/components/widgets.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/utils/color_palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;

  const CustomAppBar(
      {super.key, required this.scaffoldKey, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: buildText(
        title,
        kBlackColor,
        22,
        FontWeight.w400,
        TextAlign.center,
        TextOverflow.clip,
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
      backgroundColor: kTransparentColor,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Pages.sauapAi);
            },
            icon: const Icon(
              Icons.smart_button,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
