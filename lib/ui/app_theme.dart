import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color kPrimaryColor = Colors.white;
  static const Color kSecondaryBackgroundColor = Color(0xffF7F7FF);

  static const Color kPrimaryColorDark = Color(0xff1d3042);
  static const Color kSecondaryBackgroundColorDark = Color(0xff142434);

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
        scaffoldBackgroundColor: isLight ? kPrimaryColor : kPrimaryColorDark,
        backgroundColor:
            isLight ? kSecondaryBackgroundColor : kSecondaryBackgroundColorDark,
        primaryColor: isLight ? kPrimaryColor : kPrimaryColorDark,
        primaryColorDark: kSecondaryColor,
        bottomSheetTheme: baseTheme.bottomSheetTheme.copyWith(
            backgroundColor: isLight ? kPrimaryColor : kPrimaryColorDark),
        accentColor: kAccentColor,
        iconTheme: _getIconTheme(baseTheme.primaryIconTheme, isLight),
        snackBarTheme: _getSnackBarTheme(baseTheme.snackBarTheme),
        appBarTheme: _getAppBarTheme(baseTheme.appBarTheme, isLight,
            iconTheme: _getIconTheme(baseTheme.primaryIconTheme, isLight)),
        dialogTheme: _getDialogTheme(baseTheme.dialogTheme, isLight),
        applyElevationOverlayColor: !isLight,
        textTheme: _getTextTheme(
            GoogleFonts.ralewayTextTheme(baseTheme.textTheme), isLight),
        primaryTextTheme: _getPrimaryTextTheme(baseTheme.primaryTextTheme),
        buttonTheme:
            _getButtonTheme(baseTheme.buttonTheme, baseTheme.colorScheme));
  }

  static DialogTheme _getDialogTheme(DialogTheme baseTheme, bool isLight) {
    return baseTheme.copyWith(
        backgroundColor: isLight ? kPrimaryColor : kPrimaryColorDark,
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

  static AppBarTheme _getAppBarTheme(AppBarTheme baseTheme, bool isLight,
      {TextTheme textTheme, IconThemeData iconTheme}) {
    return baseTheme.copyWith(
        centerTitle: true,
        iconTheme: iconTheme,
        brightness: isLight ? Brightness.light : Brightness.dark,
        color: isLight ? kPrimaryColor : kPrimaryColorDark,
        textTheme: textTheme ?? baseTheme.textTheme);
  }

  static IconThemeData _getIconTheme(IconThemeData baseTheme, bool isLight) {
    return baseTheme.copyWith(
        color: isLight ? Colors.grey.shade600 : Colors.grey.shade300);
  }

  static TextTheme _getPrimaryTextTheme(TextTheme baseTheme) {
    return baseTheme.copyWith();
  }

  static SnackBarThemeData _getSnackBarTheme(SnackBarThemeData baseTheme) {
    return baseTheme.copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  }

  static TextTheme _getTextTheme(TextTheme baseTheme, bool isLight) {
    return baseTheme.copyWith(
        headline6: baseTheme.headline6.copyWith(
            color: isLight ? Colors.grey.shade900 : Colors.grey.shade200),
        headline4: baseTheme.headline4.copyWith(
          color: isLight ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        headline3: baseTheme.headline3.copyWith(
          color: kAccentColor,
          fontFamily: 'VelvetHeart',
          fontSize: 70,
        ),
        bodyText2: baseTheme.bodyText2.copyWith(
            color: isLight ? Colors.grey.shade700 : Colors.grey.shade300),
        bodyText1: baseTheme.bodyText1.copyWith(
            color: isLight ? Colors.grey.shade700 : Colors.grey.shade300,
            fontSize: 15,
            fontWeight: FontWeight.w700),
        caption: baseTheme.caption.copyWith(
            color: isLight ? Colors.grey.shade500 : Colors.grey.shade400,
            fontSize: 15),
        button: baseTheme.button.copyWith(letterSpacing: 2.0));
  }
}
