import 'package:clinic_booking_app/features/home/data/models/clinics_model.dart';

sealed class ClinicsStates {}

final class ClinicsInitialStates extends ClinicsStates {}

final class ClinicsLoadingStates extends ClinicsStates {}

final class ClinicsSuccessStates extends ClinicsStates {
  final List<ClinicsModel> clinic;

  ClinicsSuccessStates(this.clinic);
}

final class ClinicsFailureStates extends ClinicsStates {
  final String failure;

  ClinicsFailureStates(this.failure);
}
