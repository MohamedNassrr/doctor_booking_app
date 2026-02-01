import 'package:clinic_booking_app/core/services/api_service.dart';
import 'package:clinic_booking_app/core/services/facebook_auth_service.dart';
import 'package:clinic_booking_app/core/services/google_auth_service.dart';
import 'package:clinic_booking_app/features/home/data/repos/home_repos/home_repo_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn.instance);
  getIt.registerSingleton<GoogleService>(
    GoogleService(
      auth: getIt<FirebaseAuth>(),
      googleSignIn: getIt<GoogleSignIn>(),
    ),
  );
  getIt.registerSingleton<FacebookAuthService>(FacebookAuthService());

  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
