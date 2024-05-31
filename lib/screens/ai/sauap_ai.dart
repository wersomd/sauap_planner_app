import 'package:flutter/material.dart';
import 'package:sauap_planner/components/custom_app_bar.dart';
import 'package:sauap_planner/components/custom_menu.dart';

class SauapAi extends StatefulWidget {
  const SauapAi({super.key});

  @override
  State<SauapAi> createState() => _SauapAiState();
}

class _SauapAiState extends State<SauapAi> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: scaffoldKey,
        title: "Sauap AI",
      ),
      drawer: const CustomMenu(),
      body: const SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
