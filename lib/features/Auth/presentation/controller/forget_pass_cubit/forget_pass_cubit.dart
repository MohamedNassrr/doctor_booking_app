import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/forget_pass_cubit/forget_pass_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassCubit extends Cubit<ForgetPassStates> {
  ForgetPassCubit() : super(ForgetPassInitialStates());

  Future<void> sendResetCode({required String email}) async {
    emit(ForgetPassLoadingStates());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(ForgetPassSuccessStates());
    } on Exception catch (e) {
      log('failure in ResetCode:${e.toString()}');
      emit(ForgetPassFailureStates(e.toString()));
    }
  }
}
