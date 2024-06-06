import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/view/my_cats.dart';

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
      ),
      debugShowCheckedModeBanner: false,
      home: const MyCates(),
    );
  }
}
