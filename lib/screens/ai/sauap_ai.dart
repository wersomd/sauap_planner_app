import 'package:flutter/material.dart';
import 'package:sauap_planner/components/custom_app_bar.dart';
import 'package:sauap_planner/components/custom_menu.dart';
import 'package:sauap_planner/screens/ai/sauap_ai_chat_page.dart';
import 'package:sauap_planner/utils/color_palette.dart';

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
      backgroundColor: kScaffoldColor,
      appBar: CustomAppBar(
        scaffoldKey: scaffoldKey,
        title: "Sauap AI",
      ),
      drawer: const CustomMenu(),
      body: const ChatPage(),
    );
  }
}
