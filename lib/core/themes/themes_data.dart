import 'package:clinic_booking_app/core/themes/custom_themes/bottom_nav_bar_theme.dart';
import 'package:clinic_booking_app/core/themes/custom_themes/custom_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: CustomTextTheme.lightTextTheme,
    bottomNavigationBarTheme: BottomNavTheme.lightBotNavBar,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: CustomTextTheme.darkTextTheme,
    
    bottomNavigationBarTheme: BottomNavTheme.darkBotNavBar,
  );
}


