import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _user = FirebaseAuth.instance.currentUser;

  CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 25.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: theme.appBarTheme.systemOverlayStyle,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                _user != null
                    ? '${_user.photoURL}'
                    : 'assets/images/icons/user.png',
                fit: BoxFit.cover,
                width: 70,
              ),
              const SizedBox(
                width: 5.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Қош келдіңіз',
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(
                    _user != null ? '${_user.displayName}' : 'Кіру',
                    style: theme.appBarTheme.titleTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
        leadingWidth: 240,
        actions: [
          InkWell(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.dark_mode_outlined,
                size: 42,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
