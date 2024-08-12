import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/my_http_overrides.dart';
import 'package:tech_blog/view/articles/manage_article.dart';
import 'package:tech_blog/view/main_screen/main_screen.dart';
import 'package:tech_blog/view/articles/single.dart';
import 'package:tech_blog/view/splash_screen.dart';

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
      ],
      home: const SplashScreen(),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return const TextStyle(
                  fontSize: 25,
                );
              }
              return const TextStyle(
                fontSize: 20,
              );
            },
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return solidColors.seeMore;
              }
              return solidColors.primeryColor;
            },
          ),
        ),
      ),
      fontFamily: "dana",
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: solidColors.posterTitle,
        ),
        titleLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: solidColors.posterSubTitle,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 13,
          fontWeight: FontWeight.w300,
        ),
        displayMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
        displaySmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Colors.red,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Colors.green,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: solidColors.seeMore,
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: solidColors.textTitle,
          fontWeight: FontWeight.w700,
        ),
        labelSmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: solidColors.hintText,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class NamedRoute {
  static String routeMainScreen = '/MainScreen';
  static String routeSingleArticle = '/SingleArticle';
  static String manageArticle = '/ManageArticle';
}
