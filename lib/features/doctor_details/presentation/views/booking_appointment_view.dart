import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/controller/appointment_cubit/appointment_cubit.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/views/widgets/booking_appointment_body.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingAppointmentView extends StatelessWidget {
  const BookingAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).bookAppointment,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: AppColors.mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => AppointmentCubit(),
        child: const BookingAppointmentBody(),
      ),
    );
  }
}
