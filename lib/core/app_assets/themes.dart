import 'package:flutter/material.dart';
import 'package:medicate_app/core/config/colors.dart';

import '../config/dimens.dart';

ThemeData buildThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
    fontFamily: 'Urbanist',
    scaffoldBackgroundColor: AppColors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.white),
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
