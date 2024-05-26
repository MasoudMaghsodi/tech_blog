import 'package:flutter/material.dart';
import 'package:tech_blog/my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: solidColors.divider,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
