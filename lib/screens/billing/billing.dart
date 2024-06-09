import 'package:flutter/material.dart';
import 'package:sauap_planner/components/custom_app_bar.dart';
import 'package:sauap_planner/components/custom_menu.dart';
import 'package:sauap_planner/components/widgets.dart';
import 'package:sauap_planner/screens/billing/model/billing.model.dart';
import 'package:sauap_planner/utils/color_palette.dart';
import 'package:sauap_planner/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({super.key});

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await launchUrl(uri)) {
      await canLaunchUrl(uri);
    } else {
        getSnackBar('Ошибка', kRed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      key: scaffoldKey,
      drawer: const CustomMenu(),
      appBar: CustomAppBar(
        title: "Фондтар",
        scaffoldKey: scaffoldKey,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: kGrey2,
        ),
        itemCount: charityList.length,
        itemBuilder: (context, index) {
          final charity = charityList[index];
          return ListTile(
            onTap: () => _launchURL(charity.link),
            leading: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Image.asset(
                  charity.image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: buildText(
              charity.title,
              kBlackColor,
              16,
              FontWeight.w400,
              TextAlign.left,
              TextOverflow.clip,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          );
        },
      ),
    );
  }
}
