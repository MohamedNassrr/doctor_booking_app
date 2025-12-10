import 'package:clinic_booking_app/core/widgets/custom_error_widget.dart';
import 'package:clinic_booking_app/core/widgets/doctors_sorting_widget.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_details_model.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_state.dart';
import 'package:clinic_booking_app/features/home/presentation/views/tabs/doctors_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorsTab extends StatelessWidget {
  const DoctorsTab({super.key, required this.categotyTab});

  final int? categotyTab;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsStates>(
      builder: (context, state) {
        List<DoctorsDetailsModel> filteredDoctors = [];
        if (state is DoctorsSuccessStates) {
          filteredDoctors = categotyTab == 0
              ? state.doctorsDetails
              : state.doctorsDetails
                    .where((cat) => cat.category.id == categotyTab)
                    .toList();
        }
        if (state is DoctorsFailureStates) {
          return CustomErrorWidget(errorMessage: state.failure.toString());
        }
        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              sliver: SliverToBoxAdapter(
                child: DoctorsSortingWidget(
                  doctorsNumberFound: "${filteredDoctors.length}",
                  onTap: () {},
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (state is DoctorsLoadingStates) {
                    return const Skeletonizer(
                      enabled: true,
                      child: DoctorsCardItem(
                        doctorImage:
                            "https://img.freepik.com/premium-vector/grey-gradient-abstract-background-gray-background_322958-3976.jpg?semt=ais_se_enriched&w=740&q=80",
                        doctorName: ' ',
                        doctorSpecialist: ' ',
                        clinicName: ' ',
                      ),
                    );
                  } else if (state is DoctorsSuccessStates) {
                    final doctorsSuccess = filteredDoctors[index];
                    return InkWell(
                      onTap: () {},
                      child: DoctorsCardItem(
                        doctorImage: "${doctorsSuccess.doctor.image}",
                        doctorName: "${doctorsSuccess.doctor.name}",
                        doctorSpecialist: "${doctorsSuccess.category.name}",
                        clinicName: "${doctorsSuccess.clinic.name}",
                        rating: doctorsSuccess.doctor.rating,
                        onPressed: () {},
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }, childCount: filteredDoctors.length),
              ),
            ),
          ],
        );
      },
    );
  }
}
