import 'package:clinic_booking_app/features/home/data/models/doctors_details_model.dart';

sealed class DoctorsStates {}

final class DoctorsInitialStates extends DoctorsStates {}

final class DoctorsLoadingStates extends DoctorsStates {}

final class DoctorsSuccessStates extends DoctorsStates {
  final List<DoctorsDetailsModel> mappedDoctors;

  DoctorsSuccessStates(this.mappedDoctors);
}

final class DoctorsFailureStates extends DoctorsStates {
  final String failure;

  DoctorsFailureStates(this.failure);
}
