import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  DoctorsCubit(this.homeRepo) : super(DoctorsInitialStates());

  final HomeRepo homeRepo;

  Future<void> getDoctors() async {
    emit(DoctorsLoadingStates());
    final doctors = await homeRepo.fetchDoctors();
    final clinics = await homeRepo.fetchClinics();
    final categories = await homeRepo.fetchCategories();

    doctors.fold(
      (failure) {
        log('failure in fetching doctors:${failure.errMessage.toString()}');
        emit(DoctorsFailureStates(failure.errMessage.toString()));
      },
      (doctors) {
        clinics.fold(
          (failure) {
            log('failure in fetching doctors:${failure.errMessage.toString()}');
            emit(DoctorsFailureStates(failure.errMessage.toString()));
          },
          (clinics) {
            categories.fold(
              (failure) {
                log(
                  'failure in fetching doctors:${failure.errMessage.toString()}',
                );
                emit(DoctorsFailureStates(failure.errMessage.toString()));
              },
              (categories) async {
                final mappedDoctors = await homeRepo.mapDoctorsDetails(
                  doctors,
                  clinics,
                  categories,
                );
                mappedDoctors.fold(
                  (failure) {
                    log(
                      'failure in fetching doctors:${failure.errMessage.toString()}',
                    );
                    emit(DoctorsFailureStates(failure.errMessage.toString()));
                  },
                  (mappedDoctors) {
                    emit(DoctorsSuccessStates(mappedDoctors));
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
