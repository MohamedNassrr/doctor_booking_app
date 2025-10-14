import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    // Headings
    displayLarge: TextStyle(
      fontSize: 20,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5, // Line Height: 150%
    ),
    displayMedium: TextStyle(
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5, // Line Height: 150%
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5, // Line Height: 150%
    ),
    headlineMedium: TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5, // Line Height: 150%
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      height: 1.5, // Line Height: 150%
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5, // Line Height: 150%
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
      height: 1.5, // Line Height: 150%
    ),

    // Body variants (using label styles for additional body text)
    labelLarge: TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5, // Line Height: 150%
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5, // Line Height: 150%
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      height: 1.5, // Line Height: 150%
    ),

    // Body XS variants (using title styles)
    titleLarge: TextStyle(
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      height: 1.5, // Line Height: 150%
    ),
    titleMedium: TextStyle(
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600, // SemiBold
      height: 1.5, // Line Height: 150%
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5, // Line Height: 150%
    ),

    // Button
    // Using headlineSmall for button text
    headlineSmall: TextStyle(
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500, // Medium
      height: 1.5, // Line Height: 150%
    ),
  );
}
