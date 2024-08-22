import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/decorations.dart';
import 'package:tech_blog/component/dimens.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: solidColors.statusBarColor,
          child: Padding(
            padding: EdgeInsets.only(
                right: Dimens.bodyMargin, left: Dimens.bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.splash.path,
                      scale: 3,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.headlineLarge,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: solidColors.divider,
                ),
                ListTile(
                  title: Text(
                    "درباره تک بلاگ",
                    style: textTheme.headlineLarge,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: solidColors.divider,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headlineLarge,
                  ),
                  onTap: () async {
                    await Share.share(MyStrings.shareText);
                  },
                ),
                const Divider(
                  color: solidColors.divider,
                ),
                ListTile(
                  title: Text(
                    "تک بلاگ در گیت هاب",
                    style: textTheme.headlineLarge,
                  ),
                  onTap: () {
                    myLaunchUri(MyStrings.techBlogGithubUrl);
                  },
                ),
                const Divider(
                  color: solidColors.divider,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: solidColors.statusBarColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Assets.images.splash.image(height: Get.height / 13.6),
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Center(
                  child: Obx(
                () => IndexedStack(
                  index: selectedPageIndex.value,
                  children: [
                    HomeScreen(
                        size: Get.size,
                        textTheme: textTheme,
                        bodyMargin: Dimens.bodyMargin),
                    ProfileScreen(
                        size: Get.size,
                        textTheme: textTheme,
                        bodyMargin: Dimens.bodyMargin),
                  ],
                ),
              )),
            ),
            BottomNavigation(
              size: Get.size,
              bodyMargin: Dimens.bodyMargin,
              changeScreen: (int value) {
                selectedPageIndex.value = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key,
      required this.size,
      required this.bodyMargin,
      required this.changeScreen});

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
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
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: MyDecorations.mainGradiant,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: ImageIcon(
                    Assets.icons.home.provider(),
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.find<RegisterController>().toggleLogin();
                  },
                  icon: ImageIcon(
                    Assets.icons.w.provider(),
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
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
    );
  }
}
