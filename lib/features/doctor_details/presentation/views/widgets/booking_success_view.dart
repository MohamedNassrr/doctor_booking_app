import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_button.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookingSuccessView extends StatelessWidget {
  const BookingSuccessView({super.key, required this.bodyTitle});

  final String bodyTitle;

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
                  SizedBox(height: 32.h),
                  Text(
                    S.of(context).congratulations,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    textAlign: TextAlign.center,
                    bodyTitle,
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(color: AppColors.grey500),
                  ),
                  SizedBox(height: 32.h),
                  CustomTextButton(
                    title: S.of(context).done,
                    onPressed: () {
                      GoRouter.of(
                        context,
                      ).go(AppRouting.rHome);
                    },
                  ),
                  SizedBox(height: 16.h),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      S.of(context).edityourappointment,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.grey500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
