import 'package:clinic_booking_app/core/themes/app_color.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/controller/appointment_cubit/appointment_cubit.dart';
import 'package:clinic_booking_app/features/doctor_details/presentation/controller/appointment_cubit/appointment_state.dart';
import 'package:clinic_booking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectHourWidget extends StatelessWidget {
  final ValueChanged<String> onDataSelected;
  SelectHourWidget({super.key, required this.onDataSelected});

  final List<String> hours = [
    '09.00 AM',
    '09.30 AM',
    '10.00 AM',
    '10.30 AM',
    '11.00 AM',
    '11.30 AM',
    '3.00 PM',
    '3.30 PM',
    '4.00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).selectHour,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        BlocBuilder<AppointmentCubit, AppointmentStates>(
          builder: (context, state) {
            final selectHourCubit = context.read<AppointmentCubit>();
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hours.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                final isSelected = index == selectHourCubit.selectedIndex;
                return GestureDetector(
                  onTap: () {
                    selectHourCubit.updateHour(hours[index],index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.mainColor
                          : AppColors.grey50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      hours[index],
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.grey50
                            : AppColors.grey500,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
