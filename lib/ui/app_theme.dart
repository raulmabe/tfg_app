import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color kPrimaryColor = Colors.white;
  static const Color kSecondaryBackgroundColor = Color(0xffF7F7FF);

  static const Color kerrorColor = Color(0xffff6b81);

  static const Color kAccentColor = Color(0xff76DEC8); //Color(0xFF76DEC2);
  static const Color kAccentColorLight = Color(0xffBBEEE1);
  static const Color kSecondaryColor = Color(0xff8E76DE);
  static const Color kThirdColor = Color(0xff7692DE);
  static const Color kFourthColor = Color(0xff76C6DE);
  static const Color kFifthColor = Color(0xffDE76C6);
  static const Color kSixthColor = Color(0xffC276DE);

  static ThemeData getTheme({bool isLight = true}) {
    ThemeData baseTheme = isLight ? ThemeData.light() : ThemeData.dark();

    return baseTheme.copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        backgroundColor: kSecondaryBackgroundColor,
        primaryColor: kPrimaryColor,
        primaryColorDark: kSecondaryColor,
        accentColor: kAccentColor,
        iconTheme: _getIconTheme(baseTheme.primaryIconTheme),
        snackBarTheme: _getSnackBarTheme(baseTheme.snackBarTheme),
        appBarTheme: _getAppBarTheme(baseTheme.appBarTheme,
            iconTheme: _getIconTheme(baseTheme.primaryIconTheme)),
        dialogTheme: _getDialogTheme(baseTheme.dialogTheme),
        textTheme:
            _getTextTheme(GoogleFonts.ralewayTextTheme(baseTheme.textTheme)),
        primaryTextTheme: _getPrimaryTextTheme(baseTheme.primaryTextTheme),
        buttonTheme:
            _getButtonTheme(baseTheme.buttonTheme, baseTheme.colorScheme));
  }

  static DialogTheme _getDialogTheme(DialogTheme baseTheme) {
    return baseTheme.copyWith(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
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
      {TextTheme textTheme, IconThemeData iconTheme}) {
    return baseTheme.copyWith(
        centerTitle: true,
        iconTheme:
            iconTheme?.copyWith(color: Colors.grey) ?? baseTheme.iconTheme,
        brightness: Brightness.light,
        color: kPrimaryColor,
        textTheme: textTheme ?? baseTheme.textTheme);
  }

  static IconThemeData _getIconTheme(IconThemeData baseTheme) {
    return baseTheme.copyWith(color: Colors.grey.shade600);
  }

  static TextTheme _getPrimaryTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith();
  }

  static SnackBarThemeData _getSnackBarTheme(SnackBarThemeData baseTheme) {
    return baseTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  }

  static TextTheme _getTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith(
        headline6: baseTheme.headline6.copyWith(color: Colors.grey.shade900),
        headline4: baseTheme.headline4.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        headline3: baseTheme.headline3.copyWith(
          color: kAccentColor,
          fontFamily: 'VelvetHeart',
          fontSize: 70,
        ),
        bodyText2: baseTheme.bodyText2.copyWith(color: Colors.grey.shade700),
        bodyText1: baseTheme.bodyText1.copyWith(
            color: Colors.grey.shade700,
            fontSize: 15,
            fontWeight: FontWeight.w700),
        caption: baseTheme.caption
            .copyWith(color: Colors.grey.shade500, fontSize: 15),
        button: baseTheme.button.copyWith(letterSpacing: 2.0));
  }
}
