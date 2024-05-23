import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: solidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidColors.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      theme: ThemeData(
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
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
