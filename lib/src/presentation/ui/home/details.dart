import 'package:flutter/material.dart';
import 'package:sauap_planner/src/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:sauap_planner/src/utils/constants/colors.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: CustomAppBar(),
      body: const SingleChildScrollView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
          color: pinkColor,
        ),
      ),
    );
  }
}
