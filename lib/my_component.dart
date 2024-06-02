import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
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

class MainTags extends StatelessWidget {
  const MainTags({super.key, required this.textTheme, required this.index});

  final TextTheme textTheme;
  final dynamic index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
            colors: gradiantColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.bottomLeft),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtagicon.provider(),
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              tagList[index].title,
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
