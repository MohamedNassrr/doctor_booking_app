import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/features/auth/data/register_model.dart';
import 'package:clinic_booking_app/features/auth/presentation/controller/register_cubit/register_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this._auth, this._firestore) : super(RegisterInitialStates());
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<void> userRegister({
    required String email,
    required String userName,
    required String birthDate,
    required String password,
  }) async {
    emit(RegisterLoadingStates());

    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
          log('email: ${value.user!.email}');
          log('uid ${value.user!.uid}');

          createUser(
            email: email,
            userName: userName,
            birthDate: birthDate,
            uId: value.user!.uid,
          );
          emit(RegisterSuccessStates());
        })
        .catchError((failure) {
          log('failure in register ${failure.toString()}');
          emit(RegisterFailureStates(failure.toString()));
        });
  }

  void createUser({
    required String email,
    required String userName,
    required String birthDate,
    required String uId,
  }) {
    RegisterModel model = RegisterModel(
      email: email,
      userName: userName,
      birthDate: birthDate,
      uId: uId,
      profileImage: AssetsData.defaultImage,
    );
    _firestore
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((_) {
          emit(CreateUserRegisterSuccessStates());
        })
        .catchError((failure) {
          log('failure while create user:${failure.toString()}');
          emit(CreateUserRegisterFailureStates(failure.toString()));
        });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
