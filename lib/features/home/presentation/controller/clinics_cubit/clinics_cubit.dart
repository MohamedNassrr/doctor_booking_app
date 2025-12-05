import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/clinics_cubit/clinics_state.dart';

class ClinicsCubit extends Cubit<ClinicsStates> {
  ClinicsCubit(this.homeRepo) : super(ClinicsInitialStates());

  final HomeRepo homeRepo;

  Future<void> getClinics() async {
    emit(ClinicsLoadingStates());
    var result = await homeRepo.fetchClinics();

    result.fold(
      (failure) {
        log('Failure in fetching Clinics: ${failure.errMessage.toString()}');
        emit(ClinicsFailureStates(failure.errMessage));
      },
      (success) {
        emit(ClinicsSuccessStates(success));
      },
    );
  }
}
