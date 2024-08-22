import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/component/text_style.dart';
import 'package:tech_blog/my_http_overrides.dart';
import 'package:tech_blog/view/articles/manage_article.dart';
import 'package:tech_blog/view/articles/single_manage_article.dart';
import 'package:tech_blog/view/main_screen/main_screen.dart';
import 'package:tech_blog/view/articles/single.dart';
import 'package:tech_blog/view/podcast/single_podcast.dart';
// import 'package:tech_blog/view/splash_screen.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: solidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await GetStorage.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('fa'),
      theme: lightTheme(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: NamedRoute.routeMainScreen,
          page: () => MainScreen(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: NamedRoute.routeSingleArticle,
          page: () => Single(),
          binding: ArticleBinding(),
        ),
        GetPage(
          name: NamedRoute.manageArticle,
          page: () => ManageArticle(),
          binding: ArticleManagerBinding(),
        ),
        GetPage(
          name: NamedRoute.singleManageArticle,
          page: () => SingleManageArticle(),
          binding: ArticleManagerBinding(),
        ),
      ],
      // home: const SplashScreen(),
      home: const SinglePodcast(),
    );
  }
}

class NamedRoute {
  static String routeMainScreen = '/MainScreen';
  static String routeSingleArticle = '/SingleArticle';
  static String manageArticle = '/ManageArticle';
  static String singleManageArticle = '/SingleManageArticle';
}
