import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicalCenterListBody extends StatelessWidget {
  const MedicalCenterListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 232.w,
      child: InkWell(
        onTap: () {
          print('item card pressed');
        },
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 121.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Stack(
                  children: [
                    const Image(
                      width: double.infinity,
                      image: AssetImage(AssetsData.testClinicImage),
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 30.w,
                        decoration: const BoxDecoration(
                          color: AppColors.transparentGray,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              print('fav pressed');
                            },
                            icon: const Icon(
                              FontAwesomeIcons.heart,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunrise Health Clinic',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: AppColors.grey600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              const WidgetSpan(
                                child: Icon(
                                  FontAwesomeIcons.locationDot,
                                  size: 15,
                                ),
                              ),
                              WidgetSpan(child: SizedBox(width: 3.w)),
                              TextSpan(
                                text: "Nasr city",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "5.5",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              WidgetSpan(child: SizedBox(width: 3.w)),
                              const WidgetSpan(
                                child: Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: AppColors.orange,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
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
