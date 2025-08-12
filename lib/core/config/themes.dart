import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

ThemeData buildThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
    fontFamily: 'Urbanist',
    scaffoldBackgroundColor: AppColors.appBackground,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.appBackground),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: AppColors.primary,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.borderRadius),
        borderSide: const BorderSide(color: AppColors.primary, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimens.borderRadius),
        borderSide: const BorderSide(color: Color(0xFFCFD4DC), width: 1),
      ),
      constraints: const BoxConstraints(minHeight: 50),
    ),
  );
}

class AppTextStyle {
  static TextStyle style({
    Color? color,
    double? size,
    String? family,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontFamily: family,
      fontWeight: fontWeight,
    );
  }
}
