import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/widgets/icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicalCenterListBody extends StatelessWidget {
  const MedicalCenterListBody({
    super.key,
    this.onPressed,
    required this.image,
    required this.clinicName,
    required this.clinicLocation,
    this.rating,
    this.favOnPressed,
  });

  final Function()? onPressed;
  final Function()? favOnPressed;
  final String image;
  final String clinicName;
  final String clinicLocation;
  final double? rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 232.w,
      child: InkWell(
        onTap: onPressed,
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 121.h,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clinicName.isEmpty ? ' ' : clinicName,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: AppColors.grey600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextWidget(
                          title: clinicLocation.isEmpty ? ' ' : clinicLocation,
                          icon: FontAwesomeIcons.locationDot,
                          iconColor: AppColors.mainColor,
                        ),
                        IconTextWidget(
                          isIconRight: false,
                          title: rating,
                          icon: FontAwesomeIcons.solidStar,
                          iconColor: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
