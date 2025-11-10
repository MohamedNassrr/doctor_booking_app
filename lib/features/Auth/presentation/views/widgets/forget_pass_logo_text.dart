import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgetPassLogoText extends StatelessWidget {
  const ForgetPassLogoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        const Image(image: AssetImage(AssetsData.logo)),
        const SizedBox(height: 24),
        Text(
          S.of(context).forgetPassword,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.deepTeal,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          S.of(context).enterEmailVerification,
          style: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
        ),
      ],
    );
  }
}
