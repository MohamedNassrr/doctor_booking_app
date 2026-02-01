import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/widgets/icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClinicsDoctorItem extends StatelessWidget {
  const ClinicsDoctorItem({
    super.key,
    required this.image,
    required this.doctorName,
    required this.doctorSpecialist,
    required this.rating,
    this.favPressed,
  });

  final String image;
  final String doctorName;
  final String doctorSpecialist;
  final dynamic rating;
  final Function()? favPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 140.h,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              child: Padding(
                padding: const .all(12.0),
                child: Row(
                  spacing: 12,
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      width: 109.w,
                      height: 109.h,
                      decoration: BoxDecoration(
                        borderRadius: const .all(Radius.circular(12)),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: .cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 110.w,
                              child: Text(
                                doctorName,
                                style: Theme.of(context).textTheme.displaySmall!
                                    .copyWith(color: AppColors.grey800),
                              ),
                            ),
                            SizedBox(width: 23.w),
                            IconButton(
                              onPressed: favPressed,
                              icon: const Icon(FontAwesomeIcons.heart),
                            ),
                          ],
                        ),
                        SizedBox(width: 180.w, child: const Divider(height: 8)),
                        Text(
                          doctorSpecialist,
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(color: AppColors.grey600),
                        ),
                        const Spacer(),
                        IconTextWidget(
                          title: rating,
                          icon: FontAwesomeIcons.solidStar,
                          iconColor: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
