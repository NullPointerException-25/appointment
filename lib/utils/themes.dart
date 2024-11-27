import 'package:appointments_manager/utils/colors.dart';
import 'package:appointments_manager/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: FontFamily.montserrat,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
  primaryColor: ThemeColors.lightBlue,
  primaryColorLight: ThemeColors.lightBlue,
  cardColor: ThemeColors.white,
  primaryColorDark: ThemeColors.lightBlue,
  brightness: Brightness.light,
  hintColor: ThemeColors.black,
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) =>  const Icon(
        HugeIcons.strokeRoundedArrowLeft02,
        color: ThemeColors.black),
    closeButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedCancel01, color: ThemeColors.black),
    drawerButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedMenu01, color: ThemeColors.black),
    endDrawerButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedMenu01, color: ThemeColors.black),
  ),
  dividerColor: Colors.white54,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(surface: ThemeColors.white, secondary: ThemeColors.lightBlue),
);

final ThemeData darkTheme = ThemeData(
  fontFamily: FontFamily.montserrat,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.merriWeather,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  ),
  primaryColor: ThemeColors.lightBlue,
  primaryColorLight: ThemeColors.white,
  primaryColorDark: ThemeColors.lightBlue,
  brightness: Brightness.dark,
  hintColor: ThemeColors.white,
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (context) => const Icon(
        HugeIcons.strokeRoundedArrowLeft02,
        color: ThemeColors.white),
    closeButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedCancel01, color: ThemeColors.white),
    drawerButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedMenu01, color: ThemeColors.white),
    endDrawerButtonIconBuilder: (context) =>
        const Icon(HugeIcons.strokeRoundedMenu01, color: ThemeColors.white),
  ),
  dividerColor: Colors.black54,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(surface: ThemeColors.dark, brightness: Brightness.dark, secondary: ThemeColors.darkBlue),
);
