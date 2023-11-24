import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _user = FirebaseAuth.instance.currentUser;

  CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 22.0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(210, 138, 242, 1),
                  ),
                  child: Image.asset(
                    _user != null
                        ? '${_user.photoURL}'
                        : 'assets/images/icons/user-3d.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(
                    _user != null ? 'Hello, ${_user.displayName}' : 'Hello!',
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
                Icons.menu,
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
