import 'package:flutter/material.dart';
import 'package:sauap_planner/src/utils/constants/colors.dart';

class CategoriesModel {
  const CategoriesModel({
    required this.icon,
    required this.iconColor,
    required this.tileColor,
    required this.name,
  });

  final IconData icon;
  final Color iconColor;
  final Color tileColor;
  final String name;
}

List<CategoriesModel> categoriesModel = [
  const CategoriesModel(
    icon: Icons.shopping_cart,
    iconColor: whiteColor,
    tileColor: blueColor,
    name: 'Білім',
  ),
  const CategoriesModel(
    icon: Icons.school,
    iconColor: whiteColor,
    tileColor: blueColor,
    name: 'Медицина',
  ),
  const CategoriesModel(
    icon: Icons.work,
    iconColor: whiteColor,
    tileColor: blueColor,
    name: 'Бизнес',
  ),
  const CategoriesModel(
    icon: Icons.cleaning_services,
    iconColor: whiteColor,
    tileColor: blueColor,
    name: 'Жеке',
  ),
];
