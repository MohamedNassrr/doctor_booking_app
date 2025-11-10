import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        spacing: 10,
        children: [
          const Expanded(child: Divider()),
          Text(
            S.of(context).or,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.copyWith(color: AppColors.grey500),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
