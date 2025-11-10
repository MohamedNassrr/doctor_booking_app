import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/core/services/facebook_auth_service.dart';
import 'package:clinic_booking_app/core/services/google_auth_service.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/social_auth_cubit/social_auth_state.dart';

class SocialAuthCubit extends Cubit<SocialAuthStates> {
  SocialAuthCubit(this.googleAuthService, this.facebookService)
    : super(SocialAuthInitialState());

  final GoogleService googleAuthService;
  final FacebookAuthService facebookService;

  Future<void> googleSignIn() async {
    emit(GoogleSignInLoadingState());
    try {
      await googleAuthService.signInWithGoogle();
      emit(GoogleSignInSuccessState());
    } on Exception catch (e) {
      emit(GoogleSignInFailureState(e.toString()));
    }
  }

  Future<void> facebookSignIn() async {
    emit(FacebookSignInLoadingState());
    try {
      await facebookService.facebookSignIn();
      emit(FacebookSignInSuccessState());
    } on Exception catch (e) {
      log('error in facebook: ${e.toString()}');
      emit(FacebookSignInFailureState(e.toString()));
    }
  }
}
