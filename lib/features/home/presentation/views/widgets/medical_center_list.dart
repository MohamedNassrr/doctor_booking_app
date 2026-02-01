import 'package:clinic_booking_app/core/services/service_locator.dart';
import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/widgets/custom_error_widget.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo_impl.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/clinics_cubit/clinics_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/clinics_cubit/clinics_state.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/medical_center_list_body.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MedicalCenterList extends StatelessWidget {
  const MedicalCenterList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return BlocProvider(
      create: (context) =>
          ClinicsCubit(getIt.get<HomeRepoImpl>())..getClinics(),
      child: BlocBuilder<ClinicsCubit, ClinicsStates>(
        builder: (context, state) {
          if (state is ClinicsFailureStates) {
            return CustomErrorWidget(errorMessage: state.failure);
          }
          return Padding(
            padding: const .only(left: 24, bottom: 14, top: 16),
            child: Column(
              crossAxisAlignment: .start,
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
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final loadingClinics = state is ClinicsLoadingStates;
                      final successedClinics = state is ClinicsSuccessStates;

                      if (loadingClinics) {
                        return Skeletonizer(
                          enabled: loadingClinics,
                          child: const MedicalCenterListBody(
                            image:
                                "https://img.freepik.com/premium-vector/grey-gradient-abstract-background-gray-background_322958-3976.jpg?semt=ais_se_enriched&w=740&q=80",
                            clinicName: '',
                            clinicLocation: '',
                          ),
                        );
                      } else if (successedClinics) {
                        return MedicalCenterListBody(
                          onPressed: () {
                            final clinic = state.clinic[index];
                            GoRouter.of(
                              context,
                            ).push(AppRouting.rClinicDetails,extra: clinic);
                          },
                          image: "${state.clinic[index].image}",
                          clinicName: "${state.clinic[index].name}",
                          clinicLocation: "${state.clinic[index].location}",
                          rating: state.clinic[index].rating!,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
