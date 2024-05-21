import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              // AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.menu),
                  Assets.images.splash.image(height: size.height / 13.6),
                  const Icon(Icons.search),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              //Baner
              Stack(
                children: [
                  Container(
                    width: size.width / 1.25,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: Assets.images.posterTest.provider(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.25,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: gradiantColors.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
