import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/core/widgets/custom_error_widget.dart';
import 'package:clinic_booking_app/features/home/data/models/clinics_model.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_state.dart';
import 'package:clinic_booking_app/features/home/presentation/views/widgets/clinics_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class MedicalCenterDetailsBody extends StatelessWidget {
  const MedicalCenterDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsStates>(
      builder: (context, state) {
        if (state is DoctorsSuccessStates) {
          final clinic =
              GoRouterState.of(context).extra as ClinicsModel;
         final doctors = context.read<DoctorsCubit>().getDoctorsByClinic(clinic.id!);
          return ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final clinicDoctors = doctors[index];
              return ClinicsDoctorItem(
                docPressed: () {
                  GoRouter.of(context).push(
                    AppRouting.rDoctorDetails,
                    extra: clinicDoctors.doctor.id,
                  );
                },
                image: '${clinicDoctors.doctor.image}',
                doctorName: '${clinicDoctors.doctor.name}',
                doctorSpecialist: '${clinicDoctors.category.name}',
                rating: '${clinicDoctors.doctor.rating}',
              );
            },
          );
        } else if (state is DoctorsFailureStates) {
          return CustomErrorWidget(errorMessage: state.failure.toString());
        } else {
          return Center(
            child: LottieBuilder.asset(AssetsData.loadingAnimation),
          );
        }
      },
    );
  }
}
