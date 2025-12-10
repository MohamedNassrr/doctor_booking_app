import 'package:clinic_booking_app/constants.dart';
import 'package:clinic_booking_app/core/services/service_locator.dart';
import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_error_widget.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_field.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo_impl.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/category_cubit/category_state.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/carousel_slider_widget.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/categories_grid_list.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/custom_list_header.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/medical_center_list.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocProvider(
      create: (context) =>
          CategoryCubit(getIt.get<HomeRepoImpl>())..getCategories(),
      child: CustomScrollView(
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
          BlocBuilder<CategoryCubit, CategoryStates>(
            builder: (context, state) {
              if (state is CategoryFailureStates) {
                return CustomErrorWidget(errorMessage: state.failure);
              }
              return SliverGrid.builder(
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {
                  final loadingCategory = state is CategoryLoadingStates;
                  if (state is CategoryLoadingStates) {
                    return Skeletonizer(
                      enabled: loadingCategory,
                      child: CategoriesGridList(
                        categoryImage: '',
                        title: '',
                        bgColor: Colors.transparent.withValues(alpha: 0.04),
                      ),
                    );
                  } else if (state is CategorySuccessStates) {
                    return CategoriesGridList(
                      categoryImage: Constants.categoryIcon[index],
                      title: '${state.categoryModel[index].name}',
                      bgColor: Constants.categoryColor[index],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            },
          ),
          const SliverToBoxAdapter(child: MedicalCenterList()),
        ],
      ),
    );
  }
}
