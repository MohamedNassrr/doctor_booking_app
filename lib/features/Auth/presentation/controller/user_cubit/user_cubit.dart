import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/auth/data/register_model.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/user_cubit/user_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialStates());

  RegisterModel? registerModel;

  Future<void> getUserData() async {
    emit(UserGetDataLoadingStates());
    final uId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
          registerModel = RegisterModel.fromJson(value.data()!);
          emit(UserGetDataSuccessStates());
        })
        .catchError((failure) {
          log('failure in get data in firebase: ${failure.toString()}');
          emit(UserGetDataFailureStates(failure.toString()));
        });
  }
}
