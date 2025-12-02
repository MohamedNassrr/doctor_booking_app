import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorsCardItem extends StatelessWidget {
  const DoctorsCardItem({
    super.key,
    required this.doctorImage,
    required this.doctorName,
    required this.doctorSpecialist,
    required this.clinicName,
    required this.onPressed,
    required this.rating,
  });
  final String doctorImage;
  final String doctorName;
  final String doctorSpecialist;
  final String clinicName;
  final Function() onPressed;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
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
                    image: NetworkImage(doctorImage),
                    fit: .cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        doctorName,
                        style: Theme.of(context).textTheme.displaySmall!
                            .copyWith(color: AppColors.grey800),
                      ),
                      const SizedBox(width: 13),
                      IconButton(
                        onPressed: onPressed,
                        icon: const Icon(FontAwesomeIcons.heart),
                      ),
                    ],
                  ),
                  SizedBox(width: 165.w, child: const Divider(height: 8)),
                  Text(
                    doctorSpecialist,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.copyWith(color: AppColors.grey600),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(FontAwesomeIcons.locationDot, size: 15),
                        ),
                        WidgetSpan(child: SizedBox(width: 3.w)),
                        TextSpan(
                          text: clinicName,
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(color: AppColors.grey600),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const WidgetSpan(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15,
                          ),
                        ),
                        WidgetSpan(child: SizedBox(width: 4.w)),
                        TextSpan(
                          text: "$rating",
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(color: AppColors.grey600),
                        ),
                      ],
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
