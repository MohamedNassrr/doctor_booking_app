sealed class AppointmentStates {}

final class AppointmentInitialStates extends AppointmentStates {}

final class AppointmentLoadingStates extends AppointmentStates {}

final class AppointmentSuccessStates extends AppointmentStates {}
final class AppointmentHourUpdatedStates extends AppointmentStates {}

final class AppointmentFailureStates extends AppointmentStates {
  final String failure;

  AppointmentFailureStates(this.failure);
}
