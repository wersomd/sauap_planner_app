import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sauap_planner/components/widgets.dart';
import 'package:sauap_planner/screens/wrapper/wrapper.dart';
import 'package:sauap_planner/utils/color_palette.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      elevation: 0,
      backgroundColor: kWhiteColor,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: kTransparentColor,
            ),
            currentAccountPicture: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  maxRadius: 32,
                  child: Container(
                    padding: const EdgeInsets.all(
                      12.0,
                    ),
                    child: Image.asset('assets/images/profile.png'),
                  ),
                ),
              ],
            ),
            accountName: buildText(
              user != null ? "${user.displayName}" : "Сіз тіркелмедіңіз",
              kBlackColor,
              18,
              FontWeight.w600,
              TextAlign.center,
              TextOverflow.clip,
            ),
            accountEmail: buildText(
              user != null ? "${user.email}" : "",
              kBlackColor,
              15,
              FontWeight.normal,
              TextAlign.center,
              TextOverflow.clip,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: kPrimaryColor,
            ),
            title: const Text("Басты бет"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Wrapper(selectedIndex: 0),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month_outlined,
              color: kPrimaryColor,
            ),
            title: const Text("Күнтізбе"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Wrapper(selectedIndex: 1),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.money_outlined,
              color: kPrimaryColor,
            ),
            title: const Text("Фондтар"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Wrapper(selectedIndex: 2),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person_2_outlined,
              color: kPrimaryColor,
            ),
            title: const Text("Жеке кабинет"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Wrapper(selectedIndex: 3),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
