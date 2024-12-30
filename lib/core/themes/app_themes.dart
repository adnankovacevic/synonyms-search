import 'package:flutter/material.dart';
import 'package:synonyms_search/core/themes/app_colors.dart';

import 'package:synonyms_search/core/themes/app_text_styles.dart';

ThemeData themeData = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextStyles.textTheme,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      surface: Colors.white,
      onSurface: Colors.black,
      error: Colors.red,
      onError: Colors.red,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
    ),
    searchBarTheme: const SearchBarThemeData(
      backgroundColor: WidgetStatePropertyAll(AppColors.backgroundGrey),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(35),
        fixedSize: WidgetStatePropertyAll(Size(60, 60)),
        elevation: WidgetStatePropertyAll(10),
        iconColor: WidgetStatePropertyAll(Colors.black),
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
      ),
    ),
    appBarTheme: AppBarTheme(
      // toolbarHeight: 80,
      actionsIconTheme: const IconThemeData(
        size: 24,
        color: AppColors.primaryColor,
        fill: 0.4,
      ),
      iconTheme: const IconThemeData(
        size: 24,
        color: AppColors.primaryColor,
        fill: 0.4,
      ),
      centerTitle: true,
      titleSpacing: 0,
      titleTextStyle: AppTextStyles.textTheme.titleMedium,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarTextStyle: AppTextStyles.textTheme.titleMedium,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.backgroundGrey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor, foregroundColor: Colors.white),
    listTileTheme: ListTileThemeData(
      titleTextStyle: AppTextStyles.textTheme.titleMedium,
      subtitleTextStyle: AppTextStyles.textTheme.bodyMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      minVerticalPadding: 2,
      tileColor: AppColors.backgroundGrey,
      selectedTileColor: AppColors.primaryColor,
    ));
