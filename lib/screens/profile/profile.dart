import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sauap_planner/components/custom_app_bar.dart';
import 'package:sauap_planner/components/custom_menu.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/utils/color_palette.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _user = FirebaseAuth.instance.currentUser;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final Uri _charity =
      Uri.parse('https://egov.kz/cms/ru/articles/charity-foundation');

  final Uri _whatsappLink = Uri.parse('https://wa.me/+77083169375');

  String imageUrl = ' ';
  File? _image;

  void _signIn() {
    Navigator.pushReplacementNamed(context, Pages.login);
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut().then(
            (value) => Navigator.pushNamedAndRemoveUntil(
              context,
              Pages.wrapper,
              (route) => false,
            ),
          );
    } catch (e) {
      debugPrint("Error signing out: $e");
    }
  }

  void pickUploadImage() async {
    if (_user != null) {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _image = File(image.path);
          imageUrl = image.path;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kRed,
          content: Text(
            'Сурет жүктеу үшін тіркеліңіз!',
            style: TextStyle(fontSize: 16, color: kWhiteColor),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomMenu(),
      appBar: CustomAppBar(
        title: "Профиль",
        scaffoldKey: scaffoldKey,
      ),
      backgroundColor: kScaffoldColor,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                    ),
                    child: CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      radius: 60,
                      backgroundImage:
                          imageUrl == ' ' ? null : FileImage(_image!),
                      child: imageUrl == ' '
                          ? const Icon(
                              Icons.person,
                              size: 80,
                              color: kWhiteColor,
                            )
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 70,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: kWhiteColor,
                        size: 30,
                      ),
                      onPressed: () {
                        pickUploadImage();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Expanded(
            child: ListView(
              children: [
                Card(
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  color: kTransparentColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: kPrimaryColor),
                  ),
                  child: ListTile(
                    onTap: () async {
                      launchUrl(_whatsappLink);
                    },
                    leading:
                        const Icon(Icons.help_outline, color: Colors.black54),
                    title: const Text(
                      'Қолдау көрсету',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  color: kTransparentColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: kPrimaryColor),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.privacy_tip_sharp,
                      color: Colors.black54,
                    ),
                    title: const Text(
                      'Қайырымдылық қорлар',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () async {
                      if (!await launchUrl(
                        _charity,
                      )) {
                        throw Exception('Could not launch');
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  color: kTransparentColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: kPrimaryColor),
                  ),
                  child: ListTile(
                    onTap: () {
                      launchUrl(_whatsappLink);
                    },
                    leading: const Icon(
                      Icons.add_reaction_sharp,
                      color: Colors.black54,
                    ),
                    title: const Text(
                      'Достарды шақыру',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  color: kTransparentColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: kPrimaryColor),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.black54,
                    ),
                    title: Text(
                      _user != null ? 'Шығу' : 'Кіру',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: _user != null ? _signOut : _signIn,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
