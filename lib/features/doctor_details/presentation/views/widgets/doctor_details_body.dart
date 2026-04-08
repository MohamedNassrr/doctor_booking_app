import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/app_routing.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/core/widgets/custom_elevated_button.dart';
import 'package:clinic_booking_app/core/widgets/custom_error_widget.dart';
import 'package:clinic_booking_app/core/widgets/expanded_text.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/views/widgets/doctor_details_card.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/views/widgets/expertise_badge.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_details_model.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_cubit.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_state.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class DoctorDetailsBody extends StatelessWidget {
  const DoctorDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsCubit, DoctorsStates>(
      builder: (context, state) {
        if (state is DoctorsSuccessStates) {
          List<DoctorsDetailsModel> docs = [];
          final doctorId = GoRouterState.of(context).extra as int;
          docs = doctorId == 0
              ? state.mappedDoctors
              : state.mappedDoctors
                    .where((doc) => doc.doctor.id == doctorId)
                    .toList();

          final doctorsDetails = docs[0];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                DoctorDetailsCard(doctorDetails: doctorsDetails),
                SizedBox(height: 26.h),
                ExpertiseBadge(doctorDetails: doctorsDetails),
                SizedBox(height: 16.h),
                Column(
                  crossAxisAlignment: .start,
                  spacing: 4,
                  children: [
                    Text(
                      S.of(context).aboutMe,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: .w600,
                        color: AppColors.grey800,
                      ),
                    ),
                    ExpandedText(
                      text:
                          'Dr. ${doctorsDetails.doctor.name}, a dedicated ${doctorsDetails.category.name}, brings a wealth of experience and a passion for patient care to ${doctorsDetails.clinic.name} in ${doctorsDetails.clinic.location}. With years of hands-on practice, Dr. ${doctorsDetails.doctor.name} is committed to delivering personalized treatment plans, staying updated with the latest medical advancements, and ensuring every patient feels supported and well-informed throughout their care journey.',
                    ),
                  ],
                ),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push(
                      AppRouting.rBookingAppointment,
                      extra: {
                        'name': doctorsDetails.doctor.name,
                        'image': doctorsDetails.doctor.image,
                        'clinicLocation': doctorsDetails.clinic.name,
                        'spec': doctorsDetails.category.name,
                        'docId': doctorsDetails.doctor.id.toString(),
                      },
                    );
                  },
                  text: S.of(context).bookAppointment,
                ),
              ],
            ),
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
