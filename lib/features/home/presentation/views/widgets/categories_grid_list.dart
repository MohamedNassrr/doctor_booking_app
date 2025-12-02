import 'package:clinic_booking_app/constants.dart';
import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/core/widgets/custom_error_widget.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/category_cubit/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoriesGridList extends StatelessWidget {
  const CategoriesGridList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        var catCubit = context.read<CategoryCubit>();
        if (state is CategorySuccessStates) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  print('cat pressed ');
                },
                child: Container(
                  width: 57.w,
                  height: 57.h,
                  decoration: BoxDecoration(
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
                "${state.categoryModel[index].name}",
                overflow: .ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: AppColors.grey600),
              ),
            ],
          );
        } else if (state is CategoryFailureStates) {
          return CustomErrorWidget(errorMessage: state.failure);
        } else {
          return Center(child: Lottie.asset(AssetsData.loadingAnimation));
        }
      },
    );
  }
}
