import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class Constants {
  static const List<Color> categoryColor = [
    AppColors.pink,
    AppColors.green,
    AppColors.orange,
    Color(0XFFACA1CD),
    AppColors.teal,
    Color(0XFF352261),
    AppColors.darkRed,
    AppColors.paleBlue,
  ];
  static const List<String> categoryIcon = [
    AssetsData.pediatricianImage,
    AssetsData.toothImage,
    AssetsData.cariologyImage,
    AssetsData.skincareImage,
    AssetsData.bonesImage,
    AssetsData.eyeImage,
    AssetsData.esophagusImage,
    AssetsData.therapyImage,
  ];
}
