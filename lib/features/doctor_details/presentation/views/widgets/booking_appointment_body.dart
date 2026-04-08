import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/core/utils/assets_data.dart';
import 'package:clinic_booking_app/core/widgets/custom_elevated_button.dart';
import 'package:clinic_booking_app/features/doctor_details/data/models/appointments_input_model.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/controller/appointment_cubit/appointment_cubit.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/controller/appointment_cubit/appointment_state.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/views/widgets/booking_success_view.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/views/widgets/select_hour_widget.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class BookingAppointmentBody extends StatefulWidget {
  const BookingAppointmentBody({super.key});

  @override
  State<BookingAppointmentBody> createState() => _BookingAppointmentBodyState();
}

class _BookingAppointmentBodyState extends State<BookingAppointmentBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
        final appointmentCubit = context.read<AppointmentCubit>();
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            S.of(context).selectDate,
                            style: Theme.of(context).textTheme.displayLarge!
                                .copyWith(
                                  color: AppColors.mainColor,
                                  fontWeight: .w600,
                                ),
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            height: 300.h,
                            width: double.infinity,
                            child: Card(
                              child: CalendarDatePicker(
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(
                                  DateTime.now().year + 10,
                                  12,
                                  31,
                                ),
                                onDateChanged: (DateTime pickedDate) {
                                  appointmentCubit.selectedDate = pickedDate;
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 22.h),
                          SelectHourWidget(
                            onDataSelected: (String value) {
                              appointmentCubit.selectedHour = value;
                              if (appointmentCubit.selectedHour == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a time'),
                                  ),
                                );
                                return;
                              }
                            },
                          ),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  child: CustomElevatedButton(
                    onPressed: () {
                      final appointmentInput = AppointmentsInputModel(
                        pickedDate: appointmentCubit.selectedDate,
                        selectedHour: appointmentCubit.selectedHour,
                        docName: extra['name'],
                        docImage: extra['image'],
                        docSpec: extra['spec'],
                        clinicLocation: extra['clinicLocation'],
                      );

                      context.read<AppointmentCubit>().getAppointmentDetails(
                        appointmentInput,
                        docId: extra['docId'],
                      );
                    },
                    text: S.of(context).confirm,
                  ),
                ),
              ],
            ),
            if (state is AppointmentLoadingStates)
              Center(child: Lottie.asset(AssetsData.loadingAnimation)),
            if (state is AppointmentSuccessStates)
              BookingSuccessView(
                bodyTitle:
                    'Your appointment with ${extra['name']} is confirmed for ${appointmentCubit.selectedDate}, at ${appointmentCubit.selectedHour}.',
              ),
          ],
        );
      },
    );
  }
}
