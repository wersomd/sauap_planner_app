import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sauap_planner/src/utils/constants/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryText,
    required this.isActive,
  });

  final String categoryText;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: !isActive ? const Color.fromRGBO(221, 229, 249, 1) : blueColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Text(
        categoryText,
        style: GoogleFonts.montserrat(
          color: !isActive ? Colors.grey : Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
