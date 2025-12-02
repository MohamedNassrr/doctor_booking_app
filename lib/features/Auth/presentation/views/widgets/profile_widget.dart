import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(FontAwesomeIcons.arrowLeft),
            ),
            Text(
              S.of(context).fillYourProfile,
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(color: AppColors.grey700),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
