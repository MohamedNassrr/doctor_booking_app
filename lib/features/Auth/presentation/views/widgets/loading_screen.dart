import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.4),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Container(
            width: 337.w,
            height: 417.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(48)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                spacing: 32,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 65.5,
                    backgroundColor: Color(0xffA4CFC3),
                    child: Icon(
                      FontAwesomeIcons.check,
                      size: 46,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    S.of(context).congratulations,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    S.of(context).accountReady,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
                  ),
                  Lottie.asset(AssetsData.loadingAnimation),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
