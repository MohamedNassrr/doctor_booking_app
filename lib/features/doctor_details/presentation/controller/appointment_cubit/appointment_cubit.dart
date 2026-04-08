import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clinic_booking_app/features/doctor_details/data/models/appointments_input_model.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/controller/appointment_cubit/appointment_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentCubit extends Cubit<AppointmentStates> {
  AppointmentCubit() : super(AppointmentInitialStates());

  final uId = FirebaseAuth.instance.currentUser!.uid;
  DateTime selectedDate = DateTime.now();

  void updateDate(DateTime date) {
    selectedDate = date;
  }

  int? selectedIndex;
  String? selectedHour;
  void updateHour(String hour, int index) {
    selectedHour = hour;
    selectedIndex = index;
    emit(AppointmentHourUpdatedStates());
  }

  void getAppointmentDetails(
    AppointmentsInputModel appointmentsInputModel, {
    required String docId,
  }) {
    emit(AppointmentLoadingStates());
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(uId)
        .collection('userAppointments')
        .doc(docId)
        .set(appointmentsInputModel.toMap())
        .then((_) {
          emit(AppointmentSuccessStates());
        })
        .catchError((failure) {
          log('failure while save user booking: ${failure.toString()}');
          emit(AppointmentFailureStates(failure));
        });
  }
}
