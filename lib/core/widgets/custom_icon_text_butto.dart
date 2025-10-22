import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconTextButton extends StatelessWidget {
  const CustomIconTextButton({
    super.key,
    this.height = 45,
    this.boarderRadius = 12,
    this.buttonColor = Colors.white,
    this.textColor = AppColors.mainColor,
    required this.onPressed,
    required this.buttonText,
    this.width = double.infinity,
    this.isLoading = false,
    required this.image,
    required this.imageHeight,
    required this.imageWidth,
    this.spacing = 0,
  });

  final double height;
  final double width;
  final double boarderRadius;
  final Color? buttonColor;
  final Color? textColor;
  final Function() onPressed;
  final String buttonText;
  final bool isLoading;
  final String image;
  final double imageHeight;
  final double imageWidth;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(boarderRadius),
          border: Border.all(color: AppColors.grey200),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: AppColors.mainColor)
            : Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(image),
                    width: imageWidth.w,
                    height: imageHeight.h,
                  ),
                  Text(
                    buttonText,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
