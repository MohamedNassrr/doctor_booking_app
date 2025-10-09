import 'package:clinic_booking_app/constance.dart';
import 'package:clinic_booking_app/core/services/local_storage.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: Container(
          width: 49.w,
          height: 30.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color.fromARGB(93, 194, 223, 246),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.grey[200]),
            ),
            onPressed: () async{
               await LocalStorage.setData(key: 'onBoarding', value: true);
              GoRouter.of(context).pushReplacement(AppRouting.rLogin);
            },
            child: Text(
              'skip',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
