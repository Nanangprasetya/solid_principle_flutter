import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core.dart';

mixin AppTheme implements AppColors {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.primary, secondary: AppColors.secondary),
    appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
    primaryColorLight: AppColors.secondary,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
        primary: AppColors.primary,
        minimumSize: Size(Get.width, 48),
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        elevation: 0,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
        primary: AppColors.primary,
        minimumSize: Size(Get.width, 48),
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: AppColors.primary,
        minimumSize: Size(Get.width, 48),
        side: BorderSide(width: 1.0, color: AppColors.primary),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.0))),
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        elevation: 0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData();
}
