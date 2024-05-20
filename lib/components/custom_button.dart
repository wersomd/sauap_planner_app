import 'package:flutter/material.dart';
import 'package:sauap_planner/utils/color_palette.dart';

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final EdgeInsets? edgeInsets;
  final VoidCallback? onPressed;
  final Widget child;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.edgeInsets,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [kSecondColor, kPrimaryColor]),
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    final edgeInsets =
        this.edgeInsets ?? const EdgeInsets.symmetric(horizontal: 10);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          padding: edgeInsets,
        ),
        child: child,
      ),
    );
  }
}
