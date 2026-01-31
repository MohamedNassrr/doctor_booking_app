import 'dart:developer';

import 'package:clinic_booking_app/core/errors/api_failure.dart';
import 'package:clinic_booking_app/core/services/api_endpoints.dart';
import 'package:clinic_booking_app/core/services/api_service.dart';
import 'package:clinic_booking_app/features/home/data/models/categories_model.dart';
import 'package:clinic_booking_app/features/home/data/models/clinics_model.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_details_model.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_model.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<ApisFailure, List<CategoriesModel>>> fetchCategories() async {
    try {
      var data = await apiService.get(endPoint: ApiEndpoints.categoriesndPoint);
      final List<CategoriesModel> categories = [];
      for (var cat in data['categories']) {
        try {
          categories.add(CategoriesModel.fromJson(cat));
        } catch (e) {
          categories.add(CategoriesModel.fromJson(cat));
        }
      }
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<ApisFailure, List<ClinicsModel>>> fetchClinics() async {
    try {
      var data = await apiService.get(endPoint: ApiEndpoints.clinicEndPoint);
      final List<ClinicsModel> clinics = [];
      for (var clinic in data['clinics']) {
        try {
          clinics.add(ClinicsModel.fromJson(clinic));
        } catch (e) {
          clinics.add(ClinicsModel.fromJson(clinic));
        }
      }
      return right(clinics);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailures.fromDioError(e));
      }
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<ApisFailure, List<DoctorsModel>>> fetchDoctors() async {
    try {
      var data = await apiService.get(endPoint: ApiEndpoints.doctorsEndPoint);
      final List<DoctorsModel> doctors = [];
      for (var doctor in data['doctors']) {
        try {
          doctors.add(DoctorsModel.fromJson(doctor));
        } catch (e) {
          doctors.add(DoctorsModel.fromJson(doctor));
        }
      }
      return right(doctors);
    } catch (e) {
      if (e is DioException) {
        log('dioException : ${ServerFailures.fromDioError(e)}}');
        return left(ServerFailures.fromDioError(e));
      }
      log('failure in fetching : ${e.toString()}');
      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<ApisFailure, List<DoctorsDetailsModel>>> mapDoctorsDetails(
    List<DoctorsModel> doctors,
    List<ClinicsModel> clinics,
    List<CategoriesModel> categories,
  ) async {
    final List<DoctorsDetailsModel> result = doctors.map((doc) {
      final clinic = clinics.firstWhere(
        (c) => c.id == doc.clinicId,
        orElse: () => ClinicsModel(id: 0, name: 'Unknown'),
      );
      final specialist = categories.firstWhere(
        (spec) => spec.id == doc.categoryId,
        orElse: () => CategoriesModel(id: 0, name: 'Unknown'),
      );
      return DoctorsDetailsModel(
        doctor: doc,
        clinic: clinic,
        category: specialist,
      );
    }).toList();
    return right(result);
  }
}
