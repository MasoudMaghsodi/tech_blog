import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/view/home_screen.dart';
import 'package:tech_blog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: solidColors.statusBarColor,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
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
                  onTap: () {},
                ),
                const Divider(
                  color: solidColors.divider,
                ),
                ListTile(
                  title: Text(
                    "تک بلاگ در گیت هاب",
                    style: textTheme.headlineLarge,
                  ),
                  onTap: () {},
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
            Positioned.fill(
              child: Center(
                child: IndexedStack(
                  index: selectedPageIndex,
                  children: [
                    HomeScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: bodyMargin),
                    ProfileScreen(
                        size: size,
                        textTheme: textTheme,
                        bodyMargin: bodyMargin),
                  ],
                ),
              ),
            ),
            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(colors: gradiantColors.bottomNav),
            ),
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
                  onPressed: () {},
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
