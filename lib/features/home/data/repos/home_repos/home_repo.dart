import 'package:clinic_booking_app/core/errors/api_failure.dart';
import 'package:clinic_booking_app/features/home/data/models/categories_model.dart';
import 'package:clinic_booking_app/features/home/data/models/clinics_model.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ApisFailure, List<CategoriesModel>>> fetchCategories();
  Future<Either<ApisFailure, List<DoctorsModel>>> fetchDoctors();
  Future<Either<ApisFailure, List<ClinicsModel>>> fetchClinics();
}
