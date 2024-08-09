import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Get.find<HomeScreenController>().tagList[index].title!,
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'dana',
                fontSize: 16,
                color: solidColors.primeryColor,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: solidColors.primeryColor.withBlue(100),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

myLaunchUri(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("could not launch $url");
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: solidColors.primeryColor,
      size: 32,
    );
  }
}
