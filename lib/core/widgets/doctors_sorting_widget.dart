import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorsSortingWidget extends StatelessWidget {
  const DoctorsSortingWidget({
    super.key,
    required this.doctorsNumberFound,
    required this.onTap,
  });

  final String doctorsNumberFound;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: doctorsNumberFound,
            style: Theme.of(
              context,
            ).textTheme.displaySmall!.copyWith(color: AppColors.mainColor),
            children: [
              const WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(
                text: l10n.founds,
                style: Theme.of(
                  context,
                ).textTheme.displaySmall!.copyWith(color: AppColors.mainColor),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
              text: l10n.defaultSorting,
              style: Theme.of(
                context,
              ).textTheme.displaySmall!.copyWith(color: AppColors.grey500),
              children: const [
                WidgetSpan(child: SizedBox(width: 7)),
                WidgetSpan(
                  child: Icon(
                    FontAwesomeIcons.upDown,
                    size: 15.5,
                    color: AppColors.grey500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
