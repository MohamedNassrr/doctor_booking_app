import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomCalenderTheme {
  static DatePickerThemeData lightCalender = DatePickerThemeData(
    dayShape: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
      }
      if (states.contains(WidgetState.focused)) {
        // today uses focused state
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.mainColor, width: 2),
        );
      }
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));
    }),
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.mainColor; // Dark color like #1E2A3A
      }
      return Colors.transparent;
    }),

    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      }
      if (states.contains(WidgetState.disabled)) {
        return Colors.grey.shade400;
      }
      return const Color(0xFF1E2A3A);
    }),

    todayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white; // selected today → white text on dark bg
      }
      return AppColors.mainColor; // unselected today → mainColor text
    }),

    todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.mainColor; // selected today → dark bg
      }
      return Colors.transparent; // unselected today → no bg
    }),

    todayBorder: const BorderSide(
      color: AppColors.mainColor,
      width: 2,
    ), // optional subtle border
    headerBackgroundColor: Colors.transparent,
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
  );
}
