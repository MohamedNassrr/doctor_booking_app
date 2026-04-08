import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    // Headings
    displayLarge: TextStyle(
      fontSize: 20.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
    ),
    displaySmall: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
    ),
    headlineMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),

    // Body variants (using label styles for additional body text)
    labelLarge: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5,
      color: AppColors.grey500,
    ),
    labelSmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      height: 1.5,
    ),

    // Body XS variants (using title styles)
    titleLarge: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 1.5,
    ),
    titleMedium: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5,
    ),
    titleSmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5,
    ),

    // Button
    // Using headlineSmall for button text
    headlineSmall: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    // Headings
    displayLarge: TextStyle(
      fontSize: 20.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: Colors.white,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: Colors.white,
    ),

    // Body variants (using label styles for additional body text)
    labelLarge: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5,
      color: AppColors.grey500,
    ),
    labelSmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      height: 1.5,
      color: Colors.white,
    ),

    // Body XS variants (using title styles)
    titleLarge: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 1.5,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5,
      color: Colors.white,
    ),

    // Button
    // Using headlineSmall for button text
    headlineSmall: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5,
      color: Colors.white,
    ),
  );
}
