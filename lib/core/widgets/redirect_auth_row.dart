import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';

class RedirectAuthRow extends StatelessWidget {
  const RedirectAuthRow({
    super.key,
    required this.textRow,
    required this.authText,
    required this.onTap,
  });

  final String textRow;
  final String authText;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: textRow,
        style: Theme.of(
          context,
        ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
        children: [
          TextSpan(
            text: authText,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: AppColors.blue),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
