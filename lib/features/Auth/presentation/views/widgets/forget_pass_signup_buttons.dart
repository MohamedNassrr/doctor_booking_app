import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetPassAndSingUpButtons extends StatelessWidget {
  const ForgetPassAndSingUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouting.rForgtetPass);
          },
          child: Text(
            S.of(context).forgetPassword,
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.copyWith(color: AppColors.blue),
          ),
        ),
        Text.rich(
          TextSpan(
            text: S.of(context).dontHaveAccount,
            style: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
            children: [
              TextSpan(
                text: S.of(context).signUp,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(color: AppColors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    GoRouter.of(context).pushReplacement(AppRouting.rRegister);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
