import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/categories_view_body.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            l10n.allDoctors,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.mainColor,
            ),
          ),
        ),
        body: const CategoriesViewBody(),
      ),
    );
  }
}
