import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridList extends StatelessWidget {
  const CategoriesGridList({
    super.key,
    required this.categoryImage,
    required this.title,
    required this.bgColor,
  });

  final String categoryImage;
  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 57.w,
            height: 57.h,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: SizedBox(
                width: 30.w,
                height: 36.h,
                child: categoryImage.isEmpty
                    ? const SizedBox()
                    : Image.asset(
                        categoryImage,
                        color: Colors.white,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          ),
        ),
        Text(
          title.isEmpty ? " " : title,
          overflow: .ellipsis,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColors.grey600),
        ),
      ],
    );
  }
}
