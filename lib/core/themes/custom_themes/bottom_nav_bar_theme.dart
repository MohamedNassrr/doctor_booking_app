import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class BottomNavTheme {
  static BottomNavigationBarThemeData lightBotNavBar =
      const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.grey600,
        unselectedItemColor: AppColors.grey400,
      );

  static BottomNavigationBarThemeData darkBotNavBar =
      const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.grey600,
        unselectedItemColor: AppColors.grey400,
      );
}
