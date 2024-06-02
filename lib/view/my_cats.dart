import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_strings.dart';

class MyCates extends StatelessWidget {
  const MyCates({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset(
                    Assets.images.techbot.path,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    MyStrings.successfulRegistration,
                    style: textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "نام و نام خانوادگی",
                        hintStyle: textTheme.headlineLarge),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    MyStrings.chooseCats,
                    style: textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
