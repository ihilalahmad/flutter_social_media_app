import 'package:flutter/material.dart';
import 'package:tech_media/res/color.dart';

import '../fonts.dart';

class AppTheme {
  static final ThemeData myAppTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppColors.primaryMaterialColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      color: AppColors.whiteColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 22,
          fontFamily: AppFonts.sfProDisplayMedium,
          color: AppColors.primaryTextTextColor),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 40,
          fontFamily: AppFonts.sfProDisplayMedium,
          color: AppColors.primaryTextTextColor,
          fontWeight: FontWeight.w500,
          height: 1.6),
      headline2: TextStyle(
          fontSize: 32,
          fontFamily: AppFonts.sfProDisplayMedium,
          color: AppColors.primaryTextTextColor,
          fontWeight: FontWeight.w500,
          height: 1.6),
      headline3: TextStyle(
          fontSize: 28,
          fontFamily: AppFonts.sfProDisplayMedium,
          color: AppColors.primaryTextTextColor,
          fontWeight: FontWeight.w500,
          height: 1.9),
      headline4: TextStyle(
          fontSize: 24,
          fontFamily: AppFonts.sfProDisplayMedium,
          color: AppColors.primaryTextTextColor,
          fontWeight: FontWeight.w500,
          height: 1.6),
      headline5: TextStyle(
          fontSize: 20,
          fontFamily: AppFonts.sfProDisplayMedium,
          color: AppColors.primaryTextTextColor,
          fontWeight: FontWeight.w500,
          height: 1.6),
      headline6: TextStyle(
          fontSize: 17,
          fontFamily: AppFonts.sfProDisplayBold,
          color: AppColors.primaryTextTextColor,
          fontWeight: FontWeight.w700,
          height: 1.6),
      bodyText1: TextStyle(
          fontSize: 17,
          fontFamily: AppFonts.sfProDisplayBold,
          color: AppColors.primaryTextTextColor,
          fontWeight: FontWeight.w700,
          height: 1.6),
      bodyText2: TextStyle(
          fontSize: 14,
          fontFamily: AppFonts.sfProDisplayRegular,
          color: AppColors.primaryTextTextColor,
          height: 1.6),
      caption: TextStyle(
          fontSize: 12,
          fontFamily: AppFonts.sfProDisplayBold,
          color: AppColors.primaryTextTextColor,
          height: 2.26),
    ),
  );
}
