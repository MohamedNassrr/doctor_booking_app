import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/widgets/expanded_text.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/views/widgets/doctor_details_card.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/views/widgets/expertise_badge.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const DoctorDetailsCard(),
          SizedBox(height: 26.h),
          const ExpertiseBadge(),
          SizedBox(height: 16.h),
          Column(
            crossAxisAlignment: .start,
            spacing: 4,
            children: [
              Text(
                S.of(context).aboutMe,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: .w600,
                  color: AppColors.grey800,
                ),
              ),
              ExpandedText(
                text:
                    'Dr. [Name], a dedicated [specialty], brings a wealth of experience and a passion for patient care to [Clinic/Hospital Name] in [City, State]. With years of hands-on practice, Dr. [Name] is committed to delivering personalized treatment plans, staying updated with the latest medical advancements, and ensuring every patient feels supported and well-informed throughout their care journey.',
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 342.w,
            height: 48.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors.mainColor, // Set the background color
              ),
              onPressed: () {
                print('Booked');
              },
              child: Text(
                S.of(context).bookAppointment,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
