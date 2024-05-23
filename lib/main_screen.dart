import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

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
                  // header poster
                  Container(
                    width: size.width / 1.25,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(homePagePoster["imageAsset"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: gradiantColors.homePosterCoverGradiant,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // poster title
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              homePagePoster['writer'] +
                                  ' - ' +
                                  homePagePoster['date'],
                              style: textTheme.titleLarge,
                            ),
                            Row(
                              children: [
                                Text(
                                  homePagePoster['view'],
                                  style: textTheme.titleLarge,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "دوازده قدم برنامه نویسی یک دوره ی...س",
                          style: textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              // tag list
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 8, index == 0 ? bodyMargin : 15, 8),
                      child: Container(
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
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              // see more
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                child: Row(
                  children: [
                    ImageIcon(
                      Assets.icons.bluepen.provider(),
                      color: solidColors.seeMore,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      MyStrings.viewHotestBlog,
                      style: textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: bodyMargin),
                child: SizedBox(
                  height: size.height / 4.1,
                  child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 100,
                            color: Colors.amber,
                          ),
                        );
                      })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
