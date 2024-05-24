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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: solidColors.statusBarColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              Assets.images.splash.image(height: size.height / 13.6),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                    // blog list
                    SizedBox(
                      height: size.height / 4.1,
                      child: ListView.builder(
                        itemCount: blogList.getRange(0, 5).length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right: index == 0 ? bodyMargin : 15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: size.height / 5.3,
                                    width: size.width / 2.5,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  blogList[index].imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          foregroundDecoration:
                                              const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            gradient: LinearGradient(
                                              colors: gradiantColors.blogPost,
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          left: 0,
                                          right: 0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                blogList[index].writer,
                                                style: textTheme.titleLarge,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    blogList[index].views,
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 2.4,
                                  child: Text(
                                    blogList[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.icons.bluemic.provider(),
                            color: solidColors.seeMore,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            MyStrings.viewHotestPodacasts,
                            style: textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 4.1,
                      child: ListView.builder(
                        itemCount: blogList.getRange(0, 5).length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right: index == 0 ? bodyMargin : 15),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: size.height / 5.3,
                                    width: size.width / 2.5,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  blogList[index].imageUrl),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          foregroundDecoration:
                                              const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                            gradient: LinearGradient(
                                              colors: gradiantColors.blogPost,
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width / 2.4,
                                  child: Text(
                                    blogList[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: size.height / 10,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradiantColors.bottomNavBackgrnoud,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8),
                  child: Container(
                    height: size.height / 8,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      gradient:
                          LinearGradient(colors: gradiantColors.bottomNav),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                            Assets.icons.home.provider(),
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                            Assets.icons.w.provider(),
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                            Assets.icons.user.provider(),
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
