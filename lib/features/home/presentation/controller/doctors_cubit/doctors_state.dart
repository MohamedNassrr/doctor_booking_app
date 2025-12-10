import 'package:clinic_booking_app/features/home/data/models/doctors_model.dart';

sealed class DoctorsStates {}

final class DoctorsInitialStates extends DoctorsStates {}

final class DoctorsLoadingStates extends DoctorsStates {}

final class DoctorsSuccessStates extends DoctorsStates {
  final List<DoctorsModel> doctors;

  DoctorsSuccessStates(this.doctors);
}

final class DoctorsFailureStates extends DoctorsStates {
  final String failure;

  DoctorsFailureStates(this.failure);
}
