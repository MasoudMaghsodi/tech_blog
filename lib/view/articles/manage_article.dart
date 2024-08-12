import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_strings.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: appBar('مدیریت مقاله ها'),
        body: ArticleEmptyState(textTheme: textTheme),
      ),
    );
  }
}

class ArticleEmptyState extends StatelessWidget {
  const ArticleEmptyState({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.tcbotEmpty.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: MyStrings.articleEmpty,
                style: textTheme.headlineLarge,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "بریم برای نوشتن یک مقاله با حال",
                style: TextStyle(color: solidColors.systemNavigationBarColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
