import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.type,
    this.onSubmit,
    this.radius = 8,
    this.validation,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false,
    this.onChanged,
    this.hintStyle,
    this.prefix,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final Function()? suffixPressed;
  final FormFieldValidator<String>? validation;
  final double radius;
  final IconData? suffix;
  final IconData? prefix;
  final TextStyle? hintStyle;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
      
        controller: controller,
        keyboardType: type,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        obscureText: isPassword,
        validator: validation,
        decoration: InputDecoration(
         contentPadding: const EdgeInsets.all(23),
          focusedBorder: buildOutlineInputBorder(),
          border: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          hintText: hintText,
          prefixIcon: Icon(
            prefix,
            color: AppColors.grey400,
            size: 15,
            ),
          hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.grey400),
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
