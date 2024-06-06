import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_strings.dart';
import 'package:tech_blog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techbot.path,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyStrings.welcome,
                    style: textTheme.headlineLarge,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: ElevatedButton(
                  onPressed: () {
                    _showEmailBottomSheet(context, size, textTheme);
                  },
                  child: const Text(
                    "بزن بریم",
                    style:
                        TextStyle(color: solidColors.systemNavigationBarColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        print(
                            value + " is Email : " + isEmail(value).toString());
                      },
                      style: textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "magsodi333@gmail.com",
                        hintStyle: textTheme.labelSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _activateCodeBottomSheet(context, size, textTheme);
                    },
                    child: const Text(
                      'ادامه',
                      style: TextStyle(
                        color: solidColors.lightText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _activateCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: textTheme.headlineLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextField(
                      onChanged: (value) {
                        print(
                            value + " is Email : " + isEmail(value).toString());
                      },
                      style: textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "******",
                        hintStyle: textTheme.labelSmall,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const MyCates(),
                        ),
                      );
                    },
                    child: const Text(
                      'ادامه',
                      style: TextStyle(
                        color: solidColors.lightText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
