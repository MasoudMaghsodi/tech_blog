import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_component.dart';
import 'package:tech_blog/my_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: Assets.images.avatar.provider(),
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.bluepen.provider(),
                  color: solidColors.seeMore,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              'مسعود مقصودی',
              style: textTheme.headlineLarge,
            ),
            Text(
              'magsodi333@gmail.com',
              style: textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            TechDivider(size: size),
            InkWell(
              splashColor: solidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavText,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              splashColor: solidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavPodacst,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              splashColor: solidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOut,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
