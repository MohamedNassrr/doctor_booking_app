import 'package:clinic_booking_app/core/services/service_locator.dart';
import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_field.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo_impl.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/carousel_slider_widget.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/categories_grid_list.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/custom_list_header.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/medical_center_list_body.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: MediaQuery.of(context).size.height / 50,
              children: [
                CustomTextField(
                  isFilled: true,
                  prefixSize: 25,
                  borderColor: Colors.white,
                  fillColor: AppColors.grey100,
                  prefix: FontAwesomeIcons.magnifyingGlass,
                  hintText: l10n.searchDoctor,
                  type: TextInputType.text,
                  onTap: () {},
                ),
                const CarouselSliderWidget(),
                CustomListHeader(
                  headerText: l10n.categories,
                  onPressed: () {
                    GoRouter.of(context).push(AppRouting.rCategories);
                  },
                ),
              ],
            ),
          ),
        ),
        SliverGrid.builder(
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisExtent: 100,
          ),
          itemBuilder: (context, index) => BlocProvider(
            create: (context) =>
                CategoryCubit(getIt.get<HomeRepoImpl>())..fetchCategories(),
            child: CategoriesGridList(index: index),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 14,
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.medicalCenters,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: AppColors.mainColor,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 210.h,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        const MedicalCenterListBody(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
