import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomListHeader extends StatelessWidget {
  const CustomListHeader({
    super.key,
    required this.headerText,
    required this.onPressed,
  });

  final String headerText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    var l10n = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerText,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(color: AppColors.mainColor),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            l10n.seeAll,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: AppColors.grey400),
          ),
        ),
      ],
    );
  }
}
