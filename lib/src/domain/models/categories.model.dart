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
    iconColor: blueColor,
    tileColor: whiteColor,
    name: 'Shopping',
  ),
  const CategoriesModel(
    icon: Icons.school,
    iconColor: blueColor,
    tileColor: whiteColor,
    name: 'Class',
  ),
  const CategoriesModel(
    icon: Icons.work,
    iconColor: blueColor,
    tileColor: whiteColor,
    name: 'Work',
  ),
  const CategoriesModel(
    icon: Icons.cleaning_services,
    iconColor: blueColor,
    tileColor: whiteColor,
    name: 'Clean',
  )
];
