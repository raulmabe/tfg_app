import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color kAccentColor = Color(0xFF76DEC2);
  static const Color kAccentColorLight = Color(0xffBBEEE1);
  static const Color kPrimaryColor = Colors.white;
  static const Color kSecondaryBackgroundColor =
      Color(0xffF7F7FF); //Color(0xffF8FAFC);
  static const Color kerrorColor = Color(0xfff7d794); //Color(0xffff6b81);
  static const Color kSecondaryColor = Color(0xffa29bfe); //Color(0xffa29bfe);

  static ThemeData getTheme({bool isLight = true}) {
    ThemeData baseTheme = isLight ? ThemeData.light() : ThemeData.dark();

    return baseTheme.copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        backgroundColor: kSecondaryBackgroundColor,
        primaryColor: kPrimaryColor,
        primaryColorDark: kSecondaryColor,
        accentColor: kAccentColor,
        errorColor: kerrorColor,
        iconTheme: _getIconTheme(baseTheme.primaryIconTheme),
        appBarTheme: _getAppBarTheme(baseTheme.appBarTheme),
        textTheme:
            _getTextTheme(GoogleFonts.ralewayTextTheme(baseTheme.textTheme)),
        primaryTextTheme: _getPrimaryTextTheme(baseTheme.primaryTextTheme),
        buttonTheme:
            _getButtonTheme(baseTheme.buttonTheme, baseTheme.colorScheme));
  }

  static ButtonThemeData _getButtonTheme(
      ButtonThemeData baseTheme, ColorScheme baseColorScheme) {
    return baseTheme.copyWith(
        highlightColor: kAccentColorLight,
        buttonColor: kAccentColor,
        colorScheme: baseColorScheme.copyWith(secondary: Colors.white),
        textTheme: ButtonTextTheme.accent,
        splashColor: kAccentColorLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
  }

  static AppBarTheme _getAppBarTheme(AppBarTheme baseTheme,
      {TextTheme textTheme}) {
    return baseTheme.copyWith(
        brightness: Brightness.light,
        color: Colors.white,
        textTheme: textTheme ?? baseTheme.textTheme);
  }

  static IconThemeData _getIconTheme(IconThemeData baseTheme) {
    return baseTheme.copyWith(color: Colors.grey.shade600);
  }

  static TextTheme _getPrimaryTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith();
  }

  static TextTheme _getTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith(
        title: baseTheme.title.copyWith(color: Colors.grey.shade900),
        display1: baseTheme.display1.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        display2: baseTheme.display2.copyWith(
          color: kAccentColor,
          fontFamily: 'VelvetHeart',
          fontSize: 70,
        ),
        body1: baseTheme.body1.copyWith(color: Colors.grey.shade700),
        body2: baseTheme.body2.copyWith(
            color: Colors.grey.shade700,
            fontSize: 15,
            fontWeight: FontWeight.w700),
        caption: baseTheme.caption
            .copyWith(color: Colors.grey.shade400, fontSize: 20),
        button: baseTheme.button.copyWith(letterSpacing: 2.0));
  }
}
