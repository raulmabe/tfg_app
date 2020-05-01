import 'package:flutter/material.dart';

class AppTheme {
  static const Color kAccentColor = Color(0xFF76DEC2);
  static const Color kPrimaryColor = Colors.white;
  static const Color kSecondaryBackgroundColor =
      Color(0xffF7F7FF); //Color(0xffF8FAFC);

  static ThemeData getTheme({bool isLight = true}) {
    ThemeData baseTheme = isLight ? ThemeData.light() : ThemeData.dark();

    return baseTheme.copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColor: kPrimaryColor,
        primaryColorDark: kSecondaryBackgroundColor,
        accentColor: kAccentColor,
        appBarTheme: _getAppBarTheme(baseTheme.appBarTheme),
        primaryTextTheme: _getTextTheme(baseTheme.primaryTextTheme),
        buttonTheme: baseTheme.buttonTheme.copyWith());
  }

  static AppBarTheme _getAppBarTheme(AppBarTheme baseTheme,
      {TextTheme textTheme}) {
    return baseTheme.copyWith(
        brightness: Brightness.light,
        color: Colors.white,
        textTheme: textTheme ?? baseTheme.textTheme);
  }

  static TextTheme _getTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith(
        title: baseTheme.title.copyWith(color: Colors.grey.shade900),
        display2: baseTheme.display2.copyWith(
          color: kAccentColor,
          fontFamily: 'VelvetHeart',
          fontSize: 70,
        ),
        body1: baseTheme.body1.copyWith(color: Colors.grey.shade700),
        body2: baseTheme.body2.copyWith(
            color: Colors.grey.shade700,
            fontSize: 15,
            fontWeight: FontWeight.w700));
  }
}
