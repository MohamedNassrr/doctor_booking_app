import 'package:clinic_booking_app/core/services/local_storage.dart';
import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(AppColors.grey500),
      ),
      onPressed: () async{
         await LocalStorage.setData(key: 'onBoarding', value: true);
        GoRouter.of(context).pushReplacement(AppRouting.rLogin);
      },
      child: Text(
        'skip',
        style: Theme.of(
          context,
        ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
      ),
    );
  }
}
