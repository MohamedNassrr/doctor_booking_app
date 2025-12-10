import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  DoctorsCubit(this.homeRepo) : super(DoctorsInitialStates());

  final HomeRepo homeRepo;

  Future<void> getDoctors() async {
    emit(DoctorsLoadingStates());
    var result = await homeRepo.fetchDoctors();

    result.fold(
      (failure) {
        log('doctors api failure: ${failure.errMessage.toString()}');
        emit(DoctorsFailureStates(failure.errMessage));
      },
      (success) {
        emit(DoctorsSuccessStates(success));
      },
    );
  }
}
