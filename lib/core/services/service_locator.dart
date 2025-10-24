import 'package:clinic_booking_app/core/services/facebook_auth_service.dart';
import 'package:clinic_booking_app/core/services/google_auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<GoogleService>(GoogleService());
  getIt.registerSingleton<FacebookAuthService>(FacebookAuthService());
}
