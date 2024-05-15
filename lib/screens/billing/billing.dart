import 'package:flutter/material.dart';
import 'package:sauap_planner/screens/billing/model/billing.model.dart';
import 'package:url_launcher/url_launcher.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({super.key});

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фондтар'),
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.poll_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: charityList.length,
        itemBuilder: ((context, index) => ListTile(
              leading: const Icon(Icons.wb_sunny),
              title: Text(charityList[index].title),
              trailing: IconButton(
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  launchUrl(Uri.parse(charityList[index].link));
                },
              ),
            )),
      ),
    );
  }
}
