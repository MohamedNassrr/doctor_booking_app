import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/home/data/models/categories_model.dart';
import 'package:clinic_booking_app/features/home/data/models/clinics_model.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_details_model.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo.dart';
import 'package:clinic_booking_app/features/home/presentation/controller/doctors_cubit/doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsStates> {
  DoctorsCubit(this.homeRepo) : super(DoctorsInitialStates());

  final HomeRepo homeRepo;

  Future<void> getDoctors() async {
    emit(DoctorsLoadingStates());
    var doctorResult = await homeRepo.fetchDoctors();
    var clinicResult = await homeRepo.fetchClinics();
    var specialistResult = await homeRepo.fetchCategories();

    doctorResult.fold(
      (failure) {
        log('doctors api failure: ${failure.errMessage.toString()}');
        emit(DoctorsFailureStates(failure.errMessage));
      },
      (doctorsList) {
        clinicResult.fold(
          (failure) {
            log('clinics api failure: ${failure.errMessage.toString()}');
            emit(DoctorsFailureStates(failure.errMessage));
          },
          (clinicsList) {
            specialistResult.fold(
              (failure) {
                log('specialist api failure: ${failure.errMessage.toString()}');
                emit(DoctorsFailureStates(failure.errMessage));
              },
              (categoryList) {
                final clinicMapping = {for (var c in clinicsList) c.id: c};
                final categoryMapping = {
                  for (var cat in categoryList) cat.id: cat,
                };
                final doctorDetails = doctorsList.map((doctor) {
                  final clinics =
                      clinicMapping[doctor.clinicId] ??
                      ClinicsModel(id: 0, name: 'unkown clinic');
                  final categories =
                      categoryMapping[doctor.categoryId] ??
                      CategoriesModel(id: 0, name: 'unkown specialist');
                  return DoctorsDetailsModel(
                    doctor: doctor,
                    clinic: clinics,
                    category: categories,
                  );
                }).toList();
                emit(DoctorsSuccessStates(doctorDetails));
              },
            );
          },
        );
      },
    );
  }
}
