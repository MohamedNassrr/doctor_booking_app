import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_details_model.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpertiseBadge extends StatelessWidget {
  const ExpertiseBadge({super.key, required this.doctorDetails});

  final DoctorsDetailsModel doctorDetails;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Row(
      mainAxisAlignment: .center,
      spacing: 39.36,
      children: [
        Center(
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.grey100,
                radius: 30,
                child: Icon(FontAwesomeIcons.award, color: AppColors.mainColor),
              ),
              Text(
                '${doctorDetails.doctor.experience}',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.grey600),
              ),
              Text(
                l10n.experience,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.grey500,
                  fontWeight: .w400,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.grey100,
              radius: 30,
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: AppColors.mainColor,
              ),
            ),
            Text(
              '${doctorDetails.doctor.rating}',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.grey600),
            ),
            Text(
              l10n.rating,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.grey500,
                fontWeight: .w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
