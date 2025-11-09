import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/redirect_auth_row.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
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
        RedirectAuthRow(
          textRow: S.of(context).dontHaveAccount,
          authText: S.of(context).signUp,
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouting.rRegister);
          },
        ),
      ],
    );
  }
}
