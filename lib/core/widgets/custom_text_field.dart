import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.type,
    this.radius = 8,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false,
    this.hintStyle,
    this.prefix,
    this.isEnabled = true,
    this.onTap,
  });

  final String hintText;
  final TextInputType type;
  final Function()? onTap;
  final Function()? suffixPressed;
  final double radius;
  final IconData? suffix;
  final IconData? prefix;
  final TextStyle? hintStyle;
  final bool isPassword;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        keyboardType: type,
        onTap: onTap,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabled: isEnabled,
          contentPadding: const EdgeInsets.all(23),
          focusedBorder: buildOutlineInputBorder(),
          border: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          hintText: hintText,
          prefixIcon: Icon(prefix, color: AppColors.grey400, size: 15),
          hintStyle: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: AppColors.grey400),
          suffixIcon: suffix != null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
              : null,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grey300),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
