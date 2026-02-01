import 'package:clinic_booking_app/core/services/service_locator.dart';
import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/core/widgets/custom_error_widget.dart';
import 'package:clinic_booking_app/core/widgets/custom_text_field.dart';
import 'package:clinic_booking_app/features/home/data/models/categories_model.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo_impl.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/category_cubit/category_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/category_cubit/category_state.dart';
import 'package:clinic_booking_app/features/home/presentation/views/tabs/doctors_tab.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class CategoriesViewBody extends StatefulWidget {
  const CategoriesViewBody({super.key});

  @override
  State<CategoriesViewBody> createState() => _CategoriesViewBodyState();
}

class _CategoriesViewBodyState extends State<CategoriesViewBody>
    with SingleTickerProviderStateMixin {
  List<CategoriesModel> categoryList = [];
  TabController? _tabController;
  late int initialTabIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initialTabIndex = GoRouterState.of(context).extra as int? ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocProvider(
      create: (context) =>
          CategoryCubit(getIt.get<HomeRepoImpl>())..getCategories(),
      child: BlocBuilder<CategoryCubit, CategoryStates>(
        builder: (context, state) {
          if (state is CategoryFailureStates) {
            return CustomErrorWidget(errorMessage: state.failure.toString());
          } else if (state is CategoryLoadingStates) {
            return Center(
              child: LottieBuilder.asset(AssetsData.loadingAnimation),
            );
          } else if (state is CategorySuccessStates) {
            categoryList = [
              CategoriesModel(id: 0, name: "All"),
              ...state.categoryModel,
            ];
            _tabController?.dispose();
            _tabController = TabController(
              length: categoryList.length,
              vsync: this,
              initialIndex: initialTabIndex,
            );
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.028),
                  TabBar(
                    dividerHeight: 0,
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: .start,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    labelColor: AppColors.mainColor,
                    labelStyle: Theme.of(context).textTheme.labelLarge,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                        width: 2,
                      ),
                    ),
                    tabs: categoryList
                        .map((cat) => Tab(text: cat.name))
                        .toList(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: categoryList
                          .map((cat) => DoctorsTab(categotyTab: cat.id))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
