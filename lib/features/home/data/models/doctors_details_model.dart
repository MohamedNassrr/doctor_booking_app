import 'package:clinic_booking_app/features/home/data/models/categories_model.dart';
import 'package:clinic_booking_app/features/home/data/models/clinics_model.dart';
import 'package:clinic_booking_app/features/home/data/models/doctors_model.dart';

class DoctorsDetailsModel {
  final DoctorsModel doctor;    
  final ClinicsModel clinic;     
  final CategoriesModel category;  

  DoctorsDetailsModel({
    required this.doctor,
    required this.clinic,
    required this.category,
  });
}