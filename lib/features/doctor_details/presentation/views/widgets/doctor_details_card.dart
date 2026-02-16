import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/widgets/icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorDetailsCard extends StatelessWidget {
  const DoctorDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140.h,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: Padding(
          padding: const .all(12.0),
          child: Row(
            spacing: 12,
            crossAxisAlignment: .center,
            children: [
              Container(
                width: 109.w,
                height: 109.h,
                decoration: const BoxDecoration(
                  borderRadius: .all(Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://raw.githubusercontent.com/MohamedNassrr/doctor_booking_app/features/home/assets/photos/doctors/doctorm1.png',
                    ),
                    fit: .cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: .start,
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'doctorName',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.grey800,
                    ),
                  ),
                  SizedBox(width: 23.w),
                  SizedBox(width: 166.w, child: const Divider(height: 8)),
                  Text(
                    'doctorSpecialist',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.copyWith(color: AppColors.grey600),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: 150.w,
                    child: const IconTextWidget(
                      title: 'Golden Cardiology Center',
                      icon: FontAwesomeIcons.locationDot,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
