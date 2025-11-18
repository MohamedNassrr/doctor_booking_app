import 'package:clinic_booking_app/constants.dart';
import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridList extends StatelessWidget {
  const CategoriesGridList({super.key, required this.index});

  
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            print('cat pressed ');
          },
          child: Container(
            width: 57.w,
            height: 57.h,
            decoration:  BoxDecoration(
              color: Constants.categoryColor[index],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: SizedBox(
                width: 30.w,
                height: 36.h,
                child: Image.asset(
                  Constants.categoryIcon[index],
                  color: Colors.white,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Text(
          'Dentistry',
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColors.grey600),
        ),
      ],
    );
  }
}
